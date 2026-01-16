# ARCHIVE Command - Task Archiving

This command creates comprehensive archive documentation and updates the Memory Bank for future reference.

## Memory Bank Integration

Reads from:

- `memory-bank/tasks.md` - Complete task details and checklists
- `memory-bank/reflection/reflection-[task_id].md` - Reflection document
- `memory-bank/progress.md` - Implementation status
- `memory-bank/creative/creative-*.md` - Creative phase documents (Level 3-4)

Creates:

- `memory-bank/archive/archive-[task_id].md` - Archive document

Updates:

- `memory-bank/tasks.md` - Mark task as COMPLETE
- `memory-bank/progress.md` - Add archive reference
- `memory-bank/activeContext.md` - Reset for next task

## Progressive Rule Loading

### Step 1: Load Core Rules

```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
Load: .cursor/rules/isolation_rules/Core/serena-integration.mdc  # Serena MCP 통합
```

### Step 2: Load ARCHIVE Mode Map

```
Load: .cursor/rules/isolation_rules/visual-maps/archive-mode-map.mdc
```

### Step 3: Load Complexity-Specific Archive Rules

Based on complexity level from `memory-bank/tasks.md`:

**Level 1:**

```
Load: .cursor/rules/isolation_rules/Level1/quick-documentation.mdc
```

**Level 2:**

```
Load: .cursor/rules/isolation_rules/Level2/archive-basic.mdc
```

**Level 3:**

```
Load: .cursor/rules/isolation_rules/Level3/archive-intermediate.mdc
```

**Level 4:**

```
Load: .cursor/rules/isolation_rules/Level4/archive-comprehensive.mdc
```

## Workflow

1. **Verify Reflection Complete**

   - Check that `memory-bank/reflection/reflection-[task_id].md` exists
   - Verify reflection is complete
   - If not complete, return to `/reflect` command

2. **Gather Context from Serena Memory** (NEW)

   **Step 2.1: Memory Collection**
   - Use `read_memory` to collect additional context from Serena Memory:
     - Planning decisions (`plan-[task-id]`)
     - Design patterns (`creative-[feature]`)
     - Implementation summaries
     - Reflection insights (`reflection-[task-id]`)

   **Step 2.2: File Verification**
   - Use `list_dir` to verify all generated files

   **Step 2.3: Context Compilation**
   - Compile comprehensive context for archive

3. **Create Archive Document**

   **Step 3.1: Document Creation**
   - Create archive document based on complexity level:
     - **Level 1:** Create quick summary
     - **Level 2:** Create basic archive document
     - **Level 3-4:** Create comprehensive archive document
   - Include context gathered from Serena Memory
   - Reference Serena Memory entries in archive document

   **Step 3.2: Memory Bank Update**
   - Update `memory-bank/tasks.md` marking task complete (Level 1)
   - Update `memory-bank/tasks.md` and `memory-bank/progress.md` (Level 2+)
   - Archive creative phase documents (Level 3-4)
   - Document code changes, testing approach, and lessons learned (Level 3-4)

4. **Archive Document Structure**

   ```
   # TASK ARCHIVE: [Task Name]

   ## METADATA
   - Task ID, dates, complexity level

   ## SUMMARY
   Brief overview of the task

   ## REQUIREMENTS
   What the task needed to accomplish

   ## IMPLEMENTATION
   How the task was implemented

   ## TESTING
   How the solution was verified

   ## LESSONS LEARNED
   Key takeaways from the task

   ## REFERENCES
   Links to related documents (reflection, creative phases, etc.)

   ## SERENA MEMORY REFERENCES (if applicable)
   - Planning decisions, design patterns, implementation summaries
   ```

5. **Update Memory Bank & Cleanup Serena Memory** (ENHANCED)

   **Step 5.1: Memory Bank Update**
   - Create `memory-bank/archive/archive-[task_id].md`
   - Mark task as COMPLETE in `memory-bank/tasks.md`
   - Update `memory-bank/progress.md` with archive reference
   - Reset `memory-bank/activeContext.md` for next task
   - Clear completed task details from `memory-bank/tasks.md` (keep structure)

   **Step 5.2: Serena Memory Cleanup**
   - Archive Serena Memory entries (optional cleanup):
     - Keep important patterns and decisions
     - Remove temporary/task-specific entries
     - Consolidate related memories

   **Step 5.3: Cross-Reference**
   - Ensure archive document references Serena Memory entries (if applicable)

6. **Verify Archiving Completeness** (NEW)
   - Verify archive document is created
   - Verify Memory Bank is updated correctly
   - Verify Serena Memory cleanup is performed (if applicable)
   - Verify cross-references are established
   - If incomplete, return to appropriate step

## Usage

Type `/archive` to archive the completed task after reflection is done.

## Serena MCP Integration

This command integrates with Serena MCP tools for comprehensive archiving:

- **Context Collection**: Use `read_memory` to gather additional context from Serena Memory
- **File Verification**: Use `list_dir` to verify all generated files
- **Memory Cleanup**: Optionally clean up task-specific Serena Memory entries

**Key Serena Tools Used:**

- `read_memory`: Collect context from Serena Memory
- `list_dir`: Verify generated files
- `delete_memory`: Clean up temporary entries (optional)

For detailed integration strategies, see:

- `@serena-integration.mdc` - Complete integration guide (ARCHIVE Mode: 161-176줄)
- `@serena-integration-examples.mdc` - Practical examples

**Memory Strategy**:

- Archive important patterns and decisions in Memory Bank
- Keep reusable patterns in Serena Memory
- Remove temporary/task-specific entries

## Next Steps

After archiving complete, use `/van` command to start the next task.
