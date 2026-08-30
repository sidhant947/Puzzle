import 'dart:math' as math;
import 'package:flutter/material.dart';

class SymbolPair {
  final IconData cue;
  final IconData target;
  final Color color;

  SymbolPair({
    required this.cue,
    required this.target,
    required this.color,
  });
}

class PairedAssociateRound {
  final List<SymbolPair> pairsToLearn;
  final List<SymbolPair> queryQueue; // The tested sequence
  final List<IconData> allTargetSymbols;

  PairedAssociateRound({
    required this.pairsToLearn,
    required this.queryQueue,
    required this.allTargetSymbols,
  });
}

class ContinuousPairedAssociateEngine {
  static final List<IconData> _symbols = [
    Icons.star_rounded,
    Icons.favorite_rounded,
    Icons.lightbulb_rounded,
    Icons.shield_rounded,
    Icons.diamond_rounded,
    Icons.eco_rounded,
    Icons.key_rounded,
    Icons.music_note_rounded,
    Icons.rocket_launch_rounded,
    Icons.local_fire_department_rounded,
    Icons.wb_sunny_rounded,
    Icons.nightlight_round,
  ];

  static PairedAssociateRound generateRound({int numPairs = 4, math.Random? random}) {
    final rng = random ?? math.Random();
    final shuffled = List<IconData>.from(_symbols)..shuffle(rng);

    final pairs = <SymbolPair>[];
    final colors = [
      const Color(0xFF6366F1),
      const Color(0xFF10B981),
      const Color(0xFFF59E0B),
      const Color(0xFFEC4899),
      const Color(0xFF3B82F6),
      const Color(0xFF8B5CF6),
    ];

    for (int i = 0; i < numPairs; i++) {
      pairs.add(SymbolPair(
        cue: shuffled[i * 2],
        target: shuffled[i * 2 + 1],
        color: colors[i % colors.length],
      ));
    }

    final queryList = List<SymbolPair>.from(pairs)..shuffle(rng);

    return PairedAssociateRound(
      pairsToLearn: pairs,
      queryQueue: queryList,
      allTargetSymbols: pairs.map((p) => p.target).toList(),
    );
  }
}
