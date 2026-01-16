# CREATIVE Command - Design Decisions

This command performs structured design exploration for components flagged during planning.

## Memory Bank Integration

Reads from:

- `memory-bank/tasks.md` - Components requiring creative phases
- `memory-bank/activeContext.md` - Current project context

Creates:

- `memory-bank/creative/creative-[feature_name].md` - Design decision documents

Updates:

- `memory-bank/tasks.md` - Records design decisions

## Progressive Rule Loading

### Step 1: Load Core Rules

```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
Load: .cursor/rules/isolation_rules/Core/serena-integration.mdc  # Serena MCP 통합
```

### Step 2: Load CREATIVE Mode Map

```
Load: .cursor/rules/isolation_rules/visual-maps/creative-mode-map.mdc
```

### Step 3: Load Creative Phase Enforcement

```
Load: .cursor/rules/isolation_rules/Core/creative-phase-enforcement.mdc
Load: .cursor/rules/isolation_rules/Core/creative-phase-metrics.mdc
```

### Step 4: Load Specialized Creative Rules (Lazy Loaded)

Load only when specific creative phase type is needed:

**For Architecture Design:**

```
Load: .cursor/rules/isolation_rules/Phases/CreativePhase/creative-phase-architecture.mdc
```

**For UI/UX Design:**

```
Load: .cursor/rules/isolation_rules/Phases/CreativePhase/creative-phase-uiux.mdc
```

**For Algorithm Design:**

```
Load: .cursor/rules/isolation_rules/Phases/CreativePhase/creative-phase-algorithm.mdc
```

## Workflow

1. **Verify Planning Complete**

   - Check `memory-bank/tasks.md` for planning completion
   - Verify creative phases are identified
   - If not complete, return to `/plan` command

2. **Identify Creative Phases**

   - Read components flagged for creative work from `memory-bank/tasks.md`
   - Prioritize components for design exploration
   - **NEW**: Use `read_memory` to check for previous design decisions in Serena Memory

3. **Explore Existing Architecture** (NEW)

   **Step 3.1: Architecture Overview**

   - Use `get_symbols_overview` to understand existing architecture

   **Step 3.2: Reference Exploration**

   - Use `find_symbol` to explore existing implementations for reference

   **Step 3.3: Pattern Discovery**

   - Use `search_for_pattern` to find similar patterns in codebase

   **Step 3.4: Historical Context**

   - Use `read_memory` to check previous design decisions

   **Step 3.5: Document Findings**

   - Document findings to inform creative phase

4. **Execute Creative Phase**
   For each component:

   - **🎨🎨🎨 ENTERING CREATIVE PHASE: [TYPE]**
   - Define requirements and constraints
   - **Integration**: Reference existing patterns found via Serena tools
   - Generate 2-4 design options
   - Analyze pros/cons of each option
   - Select and justify recommended approach
   - Document implementation guidelines
   - Verify solution meets requirements
   - **🎨🎨🎨 EXITING CREATIVE PHASE**
   - **Integration**: Store design pattern in Serena Memory using `write_memory`

5. **Document Decisions**

   **Step 5.1: Memory Bank Documentation**

   - Create `memory-bank/creative/creative-[feature_name].md`
   - Update `memory-bank/tasks.md` with design decisions

   **Step 5.2: Serena Memory Storage**

   - Store design pattern summary in Serena Memory using `write_memory("creative-[feature]", pattern_summary)`

   **Step 5.3: Cross-Reference**

   - Link Memory Bank creative document with Serena Memory entry

6. **Verify Completion**

   **Step 6.1: Component Verification**

   - Ensure all flagged components have completed creative phases
   - Mark creative phase as complete in `memory-bank/tasks.md`

   **Step 6.2: Memory Verification**

   - Verify all design patterns stored in Serena Memory
   - Verify cross-references are established
   - If incomplete, return to appropriate step

## Usage

Type `/creative` to start creative design work for components flagged in the plan.

## Serena MCP Integration

This command integrates with Serena MCP tools for efficient design exploration:

- **Architecture Analysis**: Use `get_symbols_overview` to understand existing structure
- **Pattern Discovery**: Use `search_for_pattern` to find similar implementations
- **Reference Exploration**: Use `find_symbol` to examine existing code
- **Design Memory**: Store design patterns in Serena Memory for future reference

**Key Serena Tools Used:**

- `get_symbols_overview`: Existing architecture overview
- `find_symbol`: Explore existing implementations
- `search_for_pattern`: Find similar patterns
- `read_memory`: Previous design decisions
- `write_memory`: Store design patterns

For detailed integration strategies, see:

- `@serena-integration.mdc` - Complete integration guide (CREATIVE Mode: 101-119줄)
- `@serena-integration-examples.mdc` - Practical examples

**Token Efficiency**: Using Serena tools can reduce token usage by 70-80% compared to reading entire files.

## Next Steps

After all creative phases complete, proceed to `/build` command for implementation.
