# REFLECT Command - Task Reflection

This command facilitates structured reflection on completed implementation, documenting lessons learned and process improvements.

## Memory Bank Integration

Reads from:

- `memory-bank/tasks.md` - Completed implementation details
- `memory-bank/progress.md` - Implementation status and observations
- `memory-bank/creative/creative-*.md` - Design decisions (Level 3-4)

Creates:

- `memory-bank/reflection/reflection-[task_id].md` - Reflection document

Updates:

- `memory-bank/tasks.md` - Reflection status

## Progressive Rule Loading

### Step 1: Load Core Rules

```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
Load: .cursor/rules/isolation_rules/Core/serena-integration.mdc  # Serena MCP 통합
```

### Step 2: Load REFLECT Mode Map

```
Load: .cursor/rules/isolation_rules/visual-maps/reflect-mode-map.mdc
```

### Step 3: Load Complexity-Specific Reflection Rules

Based on complexity level from `memory-bank/tasks.md`:

**Level 1:**

```
Load: .cursor/rules/isolation_rules/Level1/quick-documentation.mdc
```

**Level 2:**

```
Load: .cursor/rules/isolation_rules/Level2/reflection-basic.mdc
```

**Level 3:**

```
Load: .cursor/rules/isolation_rules/Level3/reflection-intermediate.mdc
```

**Level 4:**

```
Load: .cursor/rules/isolation_rules/Level4/reflection-comprehensive.mdc
```

## Workflow

1. **Verify Implementation Complete**

   - Check `memory-bank/tasks.md` for implementation completion
   - If not complete, return to `/build` command

2. **Review Implementation with Serena Tools** (ENHANCED)

   **Step 2.1: Historical Context Retrieval**

   - Use `read_memory` to retrieve previous work context from Serena Memory
   - Compare current implementation with previous patterns

   **Step 2.2: Impact Analysis**

   - Use `find_referencing_symbols` to analyze impact scope of changes
   - Identify all affected components and dependencies

   **Step 2.3: Code Quality Review**

   - Use `get_symbols_overview` to review overall code structure
   - Verify architectural consistency

   **Step 2.4: Pattern Consistency Check**

   - Use `search_for_pattern` to verify pattern consistency
   - Ensure implementation follows established patterns

   **Step 2.5: Documentation**

   - Compare implementation against original plan
   - Review creative phase decisions (Level 3-4)
   - Review code changes and testing
   - Document findings

3. **Document Reflection**

   **Level 1:**

   - Quick review of bug fix
   - Document solution
   - **Integration**: Use `find_referencing_symbols` to verify fix impact (optional)
   - **Integration**: Store fix summary in Serena Memory (optional)

   **Level 2:**

   - Review enhancement
   - Document what went well
   - Document challenges
   - Document lessons learned
   - **Integration**: Use `get_symbols_overview` to review enhancement scope (optional)
   - **Integration**: Store key insights in Serena Memory using `write_memory` (optional)

   **Level 3-4:**

   - Comprehensive review of implementation
   - Compare against original plan
   - Document what went well
   - Document challenges encountered
   - Document lessons learned
   - Document process improvements
   - Document technical improvements
   - **Integration**: Compare with previous reflections stored in Serena Memory
   - **Integration**: Store key insights in Serena Memory using `write_memory`

4. **Create Reflection Document**

   - Create `memory-bank/reflection/reflection-[task_id].md`
   - Structure: Summary, What Went Well, Challenges, Lessons Learned, Process Improvements, Technical Improvements, Next Steps
   - **Integration**: Store reflection summary in Serena Memory

5. **Update Memory Bank & Serena Memory** (ENHANCED)

   **Step 5.1: Memory Bank Update**

   - Update `memory-bank/tasks.md` with reflection status
   - Mark reflection phase as complete

   **Step 5.2: Serena Memory Storage**

   - Store reflection summary in Serena Memory using `write_memory("reflection-[task-id]", summary)`
   - Include key insights, lessons learned, and improvement suggestions

   **Step 5.3: Cross-Reference**

   - Link Memory Bank reflection document with Serena Memory entry
   - Ensure both systems have consistent information

6. **Verify Reflection Completeness** (NEW)
   - Verify all required sections are documented
   - Verify Serena Memory entry is created (if applicable)
   - Verify cross-references are established
   - If incomplete, return to appropriate step

## Usage

Type `/reflect` to start reflection on the completed task.

## Serena MCP Integration

This command integrates with Serena MCP tools for comprehensive code review and reflection:

- **Impact Analysis**: Use `find_referencing_symbols` to understand change scope
- **Code Quality Review**: Use `get_symbols_overview` to review structure
- **Pattern Consistency**: Use `search_for_pattern` to verify consistency
- **Historical Context**: Use `read_memory` to compare with previous work

**Key Serena Tools Used:**

- `find_referencing_symbols`: Analyze impact scope
- `get_symbols_overview`: Review code structure
- `search_for_pattern`: Verify pattern consistency
- `read_memory`: Previous work context
- `write_memory`: Store key insights

For detailed integration strategies, see:

- `@serena-integration.mdc` - Complete integration guide (REFLECT Mode: 143-159줄)
- `@serena-integration-examples.mdc` - Practical examples (예시 4: REFLECT 모드)

**Token Efficiency**: Using Serena tools can reduce token usage by 70-80% compared to re-reading entire files.

## Next Steps

After reflection complete, proceed to `/archive` command to finalize task documentation.
