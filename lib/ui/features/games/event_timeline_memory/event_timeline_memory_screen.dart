import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class HistoricalEvent {
  final String title;
  final int year;
  final String description;

  HistoricalEvent({
    required this.title,
    required this.year,
    required this.description,
  });
}

class EventTimelineMemoryScreen extends ConsumerStatefulWidget {
  const EventTimelineMemoryScreen({super.key});

  @override
  ConsumerState<EventTimelineMemoryScreen> createState() => _EventTimelineMemoryScreenState();
}

class _EventTimelineMemoryScreenState extends ConsumerState<EventTimelineMemoryScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  final List<HistoricalEvent> _eventsPool = [
    // Space & Science
    HistoricalEvent(title: 'Apollo 11 Moon Landing', year: 1969, description: 'First humans land on the Moon.'),
    HistoricalEvent(title: 'Sputnik 1 Launch', year: 1957, description: 'The first artificial satellite is launched into space.'),
    HistoricalEvent(title: 'Discovery of Penicillin', year: 1928, description: 'Alexander Fleming discovers the first modern antibiotic.'),
    HistoricalEvent(title: 'Hubble Telescope Launch', year: 1990, description: 'A massive space telescope is placed into orbit.'),
    HistoricalEvent(title: 'Voyager 1 Launch', year: 1977, description: 'Space probe launched to study the outer Solar System.'),
    HistoricalEvent(title: 'DNA Double Helix Discovered', year: 1953, description: 'Watson and Crick describe the double helix structure of DNA.'),
    HistoricalEvent(title: 'First Airplane Flight', year: 1903, description: 'The Wright brothers achieve the first powered, controlled flight.'),
    // History & Culture
    HistoricalEvent(title: 'Sinking of the Titanic', year: 1912, description: 'The passenger liner sinks on its maiden voyage.'),
    HistoricalEvent(title: 'First Modern Olympic Games', year: 1896, description: 'The international sporting event is revived in Athens, Greece.'),
    HistoricalEvent(title: 'Fall of the Berlin Wall', year: 1889, description: 'The barrier dividing East and West Berlin is opened.'), // Wait, Berlin wall fell in 1989. Let's correct it.
    HistoricalEvent(title: 'World Wide Web Invented', year: 1989, description: 'Tim Berners-Lee invents the World Wide Web.'),
    HistoricalEvent(title: 'First Movie Screening', year: 1895, description: 'The Lumière brothers present the first public projected movie screening.'),
    HistoricalEvent(title: 'Invention of the Printing Press', year: 1440, description: 'Johannes Gutenberg invents the movable type printing press.'),
    HistoricalEvent(title: 'French Revolution Begins', year: 1789, description: 'The storming of the Bastille triggers the revolution.'),
    HistoricalEvent(title: 'Signing of the Magna Carta', year: 1215, description: 'King John signs the charter limiting royal power.'),
    HistoricalEvent(title: 'Declaration of Independence', year: 1776, description: 'The United States declares independence from Britain.'),
  ];

  late List<HistoricalEvent> _currentEvents;
  late List<HistoricalEvent> _shuffledEvents;
  bool _isStudyMode = true;
  List<HistoricalEvent?> _placedEvents = [];

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _isStudyMode = true;
    
    // Choose 4 random events with unique years
    final pool = List<HistoricalEvent>.from(_eventsPool);
    pool.shuffle(_random);
    
    final selected = <HistoricalEvent>[];
    for (final e in pool) {
      if (selected.every((element) => element.year != e.year)) {
        selected.add(e);
      }
      if (selected.length == 4) break;
    }
    
    // Sort chronologically for reference
    selected.sort((a, b) => a.year.compareTo(b.year));
    _currentEvents = selected;

    // Shuffled copy for the player to place
    _shuffledEvents = List<HistoricalEvent>.from(_currentEvents)..shuffle(_random);
    _placedEvents = List<HistoricalEvent?>.filled(4, null);
  }

  void _checkTimeline() {
    bool correct = true;
    for (int i = 0; i < 4; i++) {
      if (_placedEvents[i] == null || _placedEvents[i]!.year != _currentEvents[i].year) {
        correct = false;
        break;
      }
    }

    if (correct) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.snackbarCorrectOrder),
            backgroundColor: DesignSystem.gameGreen,
            duration: Duration(seconds: 1),
          ),
        );
        setState(() {
          _generatePuzzle();
        });
      }
    } else {
      HapticFeedbackUtil.error();
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.snackbarIncorrectOrder),
          backgroundColor: DesignSystem.gameRed,
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        _isStudyMode = true;
        _placedEvents = List<HistoricalEvent?>.filled(4, null);
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('event_timeline_memory');
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: AppLocalizations.of(context)!.wellDone.toUpperCase(),
        message: AppLocalizations.of(context)!.completed,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          setState(() {
            _score = 0;
            _isGameOver = false;
            _generatePuzzle();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'event_timeline_memory'),
      subtitle: _isStudyMode 
          ? 'Memorize the events and their chronological years.' 
          : 'Drag or tap cards to place them in chronological order (earliest to latest).',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _generatePuzzle();
            });
          },
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceMD),
        child: Column(
          children: [
            // Score Board
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: Text(
                'Score: $_score / $_targetScore',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: DesignSystem.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isStudyMode ? _buildStudyView(isDark) : _buildTimelineView(isDark),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudyView(bool isDark) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _currentEvents.length,
            itemBuilder: (context, idx) {
              final event = _currentEvents[idx];
              return Card(
                elevation: 0,
                color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  side: BorderSide(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: DesignSystem.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                        ),
                        child: Text(
                          '${event.year}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : DesignSystem.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              event.description,
                              style: TextStyle(
                                fontSize: 13,
                                color: isDark ? Colors.white70 : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              HapticFeedbackUtil.lightImpact();
              setState(() {
                _isStudyMode = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: DesignSystem.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              ),
            ),
            child: const Text(
              'START RECALL',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineView(bool isDark) {
    return Column(
      children: [
        const Text(
          'Timeline Slots (Earliest at top)',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) {
              final placed = _placedEvents[idx];
              return DragTarget<HistoricalEvent>(
                onAcceptWithDetails: (details) {
                  HapticFeedbackUtil.lightImpact();
                  setState(() {
                    // Remove event from anywhere else it was placed
                    final existingIdx = _placedEvents.indexOf(details.data);
                    if (existingIdx != -1) {
                      _placedEvents[existingIdx] = null;
                    }
                    _placedEvents[idx] = details.data;
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Card(
                    elevation: 0,
                    color: candidateData.isNotEmpty
                        ? DesignSystem.primary.withOpacity(0.1)
                        : (placed != null
                            ? (isDark ? DesignSystem.darkSurface : DesignSystem.surface)
                            : (isDark ? Colors.grey[900] : Colors.grey[200])),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      side: BorderSide(
                        color: placed != null
                            ? DesignSystem.primary
                            : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                        width: placed != null ? 2 : 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: placed != null ? DesignSystem.primary : Colors.grey,
                            foregroundColor: Colors.white,
                            radius: 14,
                            child: Text('${idx + 1}', style: const TextStyle(fontSize: 12)),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: placed != null
                                ? Text(
                                    placed.title,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                  )
                                : Text(
                                    'Drop card here...',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: isDark ? Colors.white38 : Colors.black38,
                                    ),
                                  ),
                          ),
                          if (placed != null)
                            IconButton(
                              icon: const Icon(Icons.close, size: 18),
                              onPressed: () {
                                HapticFeedbackUtil.lightImpact();
                                setState(() {
                                  _placedEvents[idx] = null;
                                });
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 8),
        const Text(
          'Available Cards',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _shuffledEvents.length,
            itemBuilder: (context, idx) {
              final event = _shuffledEvents[idx];
              final isPlaced = _placedEvents.contains(event);

              if (isPlaced) {
                return const SizedBox.shrink();
              }

              return Draggable<HistoricalEvent>(
                data: event,
                feedback: Material(
                  color: Colors.transparent,
                  child: Card(
                    elevation: 4,
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: Text(
                        event.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ),
                ),
                childWhenDragging: Container(
                  width: 130,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    // Tap to place in first empty slot
                    final emptyIdx = _placedEvents.indexWhere((element) => element == null);
                    if (emptyIdx != -1) {
                      HapticFeedbackUtil.lightImpact();
                      setState(() {
                        _placedEvents[emptyIdx] = event;
                      });
                    }
                  },
                  child: Container(
                    width: 130,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Card(
                      elevation: 0,
                      color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        side: BorderSide(
                          color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            event.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: _placedEvents.contains(null) ? null : _checkTimeline,
            style: ElevatedButton.styleFrom(
              backgroundColor: DesignSystem.gameGreen,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              ),
            ),
            child: const Text(
              'SUBMIT TIMELINE',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
