# BUILD Command - Code Implementation

This command implements the planned changes following the implementation plan and creative phase decisions. It enforces a test-driven approach where tests are written for all success criteria and must pass before completing each phase.

## Memory Bank Integration

Reads from:

- `memory-bank/tasks.md` - Implementation plan and checklists
- `memory-bank/creative/creative-*.md` - Design decisions (Level 3-4)
- `memory-bank/activeContext.md` - Current project context

Updates:

- `memory-bank/tasks.md` - Implementation progress, test results, and status
- `memory-bank/progress.md` - Build status, test outcomes, and observations

## Progressive Rule Loading

### Step 1: Load Core Rules

```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
Load: .cursor/rules/isolation_rules/Core/command-execution.mdc
Load: .cursor/rules/isolation_rules/Core/serena-integration.mdc  # Serena MCP 통합
```

### Step 2: Load BUILD Mode Map

```
Load: .cursor/rules/isolation_rules/visual-maps/implement-mode-map.mdc
```

### Step 3: Load Complexity-Specific Implementation Rules

Based on complexity level from `memory-bank/tasks.md`:

**Level 1:**

```
Load: .cursor/rules/isolation_rules/Level1/workflow-level1.mdc
Load: .cursor/rules/isolation_rules/Level1/optimized-workflow-level1.mdc
```

**Level 2:**

```
Load: .cursor/rules/isolation_rules/Level2/workflow-level2.mdc
```

**Level 3-4:**

```
Load: .cursor/rules/isolation_rules/Level3/implementation-intermediate.mdc
Load: .cursor/rules/isolation_rules/Level4/phased-implementation.mdc
```

## Workflow

1. **Verify Prerequisites**

   - Check `memory-bank/tasks.md` for planning completion
   - For Level 3-4: Verify creative phase documents exist
   - Review implementation plan

2. **Determine Complexity Level**

   - Read complexity level from `memory-bank/tasks.md`
   - Load appropriate workflow rules

3. **Execute Implementation**

   **Level 1 (Quick Bug Fix):**

   **Step 3.1.1: Code Location**

   - Review bug report
   - Use `find_symbol` to locate relevant code (token-efficient)
   - Use `get_symbols_overview` to understand code structure
   - Use `find_referencing_symbols` to check impact

   **Step 3.1.2: Implementation**

   - Implement targeted fix using `replace_symbol_body` or `replace_content`
   - Verify references using `find_referencing_symbols`

   **Step 3.1.3: Testing & Documentation**

   - Write test(s) validating the fix
   - Run tests and ensure they pass
   - Update `memory-bank/tasks.md`
   - Store fix summary in Serena Memory (optional)

   **Level 2 (Simple Enhancement):**

   **Step 3.2.1: Code Analysis**

   - Review build plan
   - Use `get_symbols_overview` to examine relevant code areas
   - Use `find_symbol` to identify symbols to modify

   **Step 3.2.2: Implementation**

   - Implement changes sequentially using Serena symbol editing tools:
     - `replace_symbol_body`: Replace entire symbol
     - `insert_after_symbol`: Add code after symbol
     - `insert_before_symbol`: Add code before symbol
     - `replace_content`: Partial code modification
   - Use `find_referencing_symbols` to verify all references updated

   **Step 3.2.3: Testing & Documentation**

   - Write tests for each success criterion
   - Run all tests and ensure they pass
   - Update `memory-bank/tasks.md`
   - Store implementation summary in Serena Memory

   **Level 3-4 (Feature/System):**

   **Step 3.3.1: Preparation**

   - Review plan and creative decisions
   - Use `read_memory` to retrieve design patterns from Serena Memory
   - Create directory structure

   **Step 3.3.2: Phase Implementation**

   - For each phase:
     - Use `find_symbol` to identify symbols to create/modify
     - Use `get_symbols_overview` to understand integration points
     - Implement using Serena symbol editing tools
     - Use `find_referencing_symbols` to verify integration
     - Write tests for all phase success criteria
     - Run tests and ensure they pass
     - Do NOT proceed to next phase until all tests pass

   **Step 3.3.3: Finalization**

   - Integration testing
   - Document implementation
   - Update `memory-bank/tasks.md` and `memory-bank/progress.md`
   - Store phase summaries in Serena Memory

4. **Test-Driven Phase Completion**

   - Extract success criteria from current phase in `memory-bank/tasks.md`
   - Write test cases covering each success criterion
   - Execute all tests
   - **Gate:** All tests MUST pass before phase completion
   - Document test results in `memory-bank/tasks.md`
   - If tests fail: fix implementation, re-run tests, repeat until all pass

5. **Command Execution**

   - Document all commands executed
   - Document results and observations
   - Follow platform-specific command guidelines

6. **Verify Build Completeness** (ENHANCED)

   **Step 6.1: Build Verification**

   - Verify all build steps completed
   - Verify all success criteria tests pass
   - Verify changes meet requirements

   **Step 6.2: Memory Verification**

   - Verify implementation summaries stored in Serena Memory (if applicable)
   - Verify cross-references are established

   **Step 6.3: Final Update**

   - Update `memory-bank/tasks.md` with completion status

## Usage

Type `/build` to start implementation based on the plan in `memory-bank/tasks.md`.

## Serena MCP Integration

This command integrates with Serena MCP tools for precise, token-efficient code implementation:

- **Symbol-Based Editing**: Use `replace_symbol_body`, `insert_after_symbol`, etc. instead of file-based editing
- **Impact Analysis**: Use `find_referencing_symbols` to verify all references are updated
- **Code Exploration**: Use `get_symbols_overview` and `find_symbol` to understand code structure
- **Memory Integration**: Retrieve design patterns from Serena Memory

**Key Serena Tools Used:**

- `find_symbol`: Identify symbols to edit
- `replace_symbol_body`: Replace entire symbol
- `insert_after_symbol`: Add code after symbol
- `insert_before_symbol`: Add code before symbol
- `replace_content`: Partial code modification
- `find_referencing_symbols`: Verify references
- `get_symbols_overview`: Understand structure
- `read_memory`: Retrieve design patterns

For detailed integration strategies, see:

- `@serena-integration.mdc` - Complete integration guide (BUILD Mode: 121-141줄)
- `@serena-integration-examples.mdc` - Practical examples (예시 1: BUILD 모드)

**Token Efficiency**: Using Serena tools can reduce token usage by 70-80% compared to reading and editing entire files.

## Next Steps

After implementation complete, proceed to `/reflect` command for task review.
