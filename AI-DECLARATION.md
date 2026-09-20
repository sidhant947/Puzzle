---
version: "0.1.2"
level: auto
processes:
  design: pair
  implementation: copilot
  documentation: auto
  testing: copilot
  review: none
  deployment: none
---

This format is based on [AI-DECLARATION.md](https://ai-declaration.md/en/0.1.2).

## Notes

- First to all , which llm was used , it is - Local LLM is used via [Ollama](https://ollama.com/) paired with [OpenCode](https://opencode.ai/). No online LLM was ever used in project development.

### What LLM/AI is used for

- Design - pair: LLM chooses colors for themes/skins , font size and font weight selection to fit all age groups preferences .
- Implementation - copilot: LLM generated code which implemented to make logic better and also gives new ideas to explore to random game generation differently which can shorten the generation time and require less computing power so low end phones can have faster puzzle generation and not crash due to hardware limitations.
- Documentation - auto:  All Translations are done via LLM. Weblate application was rejected for some reason during start of development so LLM used for all translations , ~/docs/ & ~/assets/. 
- Testing - copilot: LLM helps in generating test cases based on the puzzle generation file. Tests are executed by human , not LLM.
- Review - none:  No LLM used.
- Deployment - none:  No LLM used.

### Expectations for contributors

If you use AI to help write a contribution, **please just declare it first**. PR which can be done easily with simple logic will be rejected as LLM puts a lot of overthinking , which was never necessary for specific problem PR trying to solve. 
 