# PLAN Command - Task Planning

This command creates detailed implementation plans based on complexity level determined in VAN mode.

## Memory Bank Integration

Reads from:

- `memory-bank/tasks.md` - Task requirements and complexity level
- `memory-bank/activeContext.md` - Current project context
- `memory-bank/projectbrief.md` - Project foundation (if exists)

Updates:

- `memory-bank/tasks.md` - Adds detailed implementation plan

## Progressive Rule Loading

### Step 1: Load Core Rules

```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
Load: .cursor/rules/isolation_rules/Core/serena-integration.mdc  # Serena MCP 통합
```

### Step 2: Load PLAN Mode Map

```
Load: .cursor/rules/isolation_rules/visual-maps/plan-mode-map.mdc
```

### Step 3: Load Complexity-Specific Planning Rules

Based on complexity level from `memory-bank/tasks.md`:

**Level 2:**

```
Load: .cursor/rules/isolation_rules/Level2/task-tracking-basic.mdc
Load: .cursor/rules/isolation_rules/Level2/workflow-level2.mdc
```

**Level 3:**

```
Load: .cursor/rules/isolation_rules/Level3/task-tracking-intermediate.mdc
Load: .cursor/rules/isolation_rules/Level3/planning-comprehensive.mdc
Load: .cursor/rules/isolation_rules/Level3/workflow-level3.mdc
```

**Level 4:**

```
Load: .cursor/rules/isolation_rules/Level4/task-tracking-advanced.mdc
Load: .cursor/rules/isolation_rules/Level4/architectural-planning.mdc
Load: .cursor/rules/isolation_rules/Level4/workflow-level4.mdc
```

## Workflow

1. **Read Task Context**

   **Step 1.1: Memory Bank Reading**

   - Read `memory-bank/tasks.md` to get complexity level
   - Read `memory-bank/activeContext.md` for current context

   **Step 1.2: Serena Memory Check**

   - Use `read_memory` to check for previous planning context in Serena Memory

   **Step 1.3: Codebase Exploration**

   - Use `get_symbols_overview` to explore codebase structure (token-efficient)
   - Use `list_dir` to understand project directory structure

2. **Analyze Codebase with Serena Tools** (NEW)

   **Step 2.1: Component Overview**

   - Use `get_symbols_overview` to get overview of relevant components/modules

   **Step 2.2: Symbol Identification**

   - Use `find_symbol` to identify symbols needed for planning

   **Step 2.3: Dependency Analysis**

   - Use `find_referencing_symbols` to analyze dependencies

   **Step 2.4: Pattern Discovery**

   - Use `search_for_pattern` to find related patterns in codebase

   **Step 2.5: Document Findings**

   - Document findings in Memory Bank

3. **Create Implementation Plan**

   - **Level 2:** Document planned changes, files to modify, implementation steps
   - **Level 3:** Create comprehensive plan with components, dependencies, challenges
   - **Level 4:** Create phased implementation plan with architectural considerations
   - **Integration**: Store technical decisions in Serena Memory using `write_memory`

4. **Technology Validation** (Level 2-4)

   - Document technology stack selection
   - Create proof of concept if needed
   - Verify dependencies and build configuration
   - **Integration**: Store validation results in Serena Memory

5. **Identify Creative Phases**

   - Flag components requiring design decisions
   - Document which components need creative exploration
   - **Integration**: Store creative phase requirements in Serena Memory

6. **Update Memory Bank & Serena Memory** (ENHANCED)

   **Step 6.1: Memory Bank Update**

   - Update `memory-bank/tasks.md` with complete plan
   - Mark planning phase as complete

   **Step 6.2: Serena Memory Storage**

   - Store plan summary in Serena Memory using `write_memory("plan-[task-id]", summary)`

   **Step 6.3: Cross-Reference**

   - Link Memory Bank plan with Serena Memory entry

7. **Verify Planning Completeness** (NEW)
   - Verify all required plan sections are documented
   - Verify Serena Memory entry is created
   - Verify creative phases are identified (if applicable)
   - If incomplete, return to appropriate step

## Usage

Type `/plan` to start planning based on the task in `memory-bank/tasks.md`.

## Serena MCP Integration

This command integrates with Serena MCP tools for efficient codebase analysis and planning:

- **Codebase Exploration**: Use `get_symbols_overview` instead of reading entire files
- **Dependency Analysis**: Use `find_referencing_symbols` to understand impact
- **Pattern Discovery**: Use `search_for_pattern` to find related implementations
- **Memory Integration**: Store planning decisions in both Memory Bank and Serena Memory

**Key Serena Tools Used:**

- `get_symbols_overview`: Related components/modules overview
- `find_symbol`: Identify symbols needed for planning
- `find_referencing_symbols`: Dependency analysis
- `search_for_pattern`: Related pattern search
- `read_memory`: Previous planning context
- `write_memory`: Store technical decisions

For detailed integration strategies, see:

- `@serena-integration.mdc` - Complete integration guide (PLAN Mode: 81-99줄)
- `@serena-integration-examples.mdc` - Practical examples

**Token Efficiency**: Using Serena tools can reduce token usage by 60-80% compared to reading entire files.

## Next Steps

- **If creative phases identified:** Use `/creative` command
- **If no creative phases:** Proceed to `/build` command
