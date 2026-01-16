# VAN Command - Initialization & Entry Point

This command initializes the Memory Bank system, performs platform detection, determines task complexity, and routes to appropriate workflows.

## Memory Bank Integration

**CRITICAL:** All Memory Bank files are located in `memory-bank/` directory:

- `memory-bank/tasks.md` - Source of truth for task tracking
- `memory-bank/activeContext.md` - Current focus
- `memory-bank/progress.md` - Implementation status
- `memory-bank/projectbrief.md` - Project foundation

## Progressive Rule Loading

This command loads rules progressively to optimize context usage:

### Step 1: Load Core Rules (Always Required)

```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
Load: .cursor/rules/isolation_rules/Core/platform-awareness.mdc
Load: .cursor/rules/isolation_rules/Core/file-verification.mdc
Load: .cursor/rules/isolation_rules/Core/serena-integration.mdc  # Serena MCP 통합
```

### Step 2: Load VAN Mode Map

```
Load: .cursor/rules/isolation_rules/visual-maps/van_mode_split/van-mode-map.mdc
```

### Step 3: Load Complexity-Specific Rules (Based on Task Analysis)

After determining complexity level, load:

- **Level 1:** `.cursor/rules/isolation_rules/Level1/workflow-level1.mdc`
- **Level 2-4:** Load plan mode rules (transition to PLAN command)

## Workflow

1. **Platform Detection**

   - Detect operating system
   - Adapt commands for platform
   - Set path separators

2. **Serena Onboarding Check** (NEW)

   **Step 2.1: Check Onboarding Status**

   - Use `check_onboarding_performed` to verify project onboarding status

   **Step 2.2: Perform Onboarding (if needed)**

   - If not onboarded, use `onboarding` to initialize Serena project context
   - This runs in parallel with Memory Bank initialization

3. **Memory Bank Verification**

   **Step 3.1: Directory Check**

   - Check if `memory-bank/` directory exists
   - If not, create Memory Bank structure

   **Step 3.2: Essential Files Verification**

   - Verify essential files exist
   - Create missing files if needed

   **Step 3.3: Serena Memory Sync**

   - Sync with Serena Memory if onboarding was performed
   - Ensure consistency between systems

4. **Project Structure Exploration** (NEW)

   **Step 4.1: Directory Structure**

   - Use `list_dir` to explore project structure (token-efficient)

   **Step 4.2: Critical Files**

   - Use `find_file` to locate critical files

   **Step 4.3: Update Memory Bank**

   - Update Memory Bank with discovered structure

5. **Task Analysis**

   - Read `memory-bank/tasks.md` if exists
   - Analyze task requirements
   - Determine complexity level (1-4)
   - **Integration**: Store initial context in Serena Memory for quick reference

6. **Route Based on Complexity**

   - **Level 1:** Continue in VAN mode, proceed to implementation
   - **Level 2-4:** Transition to `/plan` command

7. **Update Memory Bank & Serena Memory** (ENHANCED)

   **Step 7.1: Memory Bank Update**

   - Update `memory-bank/tasks.md` with complexity determination
   - Update `memory-bank/activeContext.md` with current focus

   **Step 7.2: Serena Memory Storage**

   - Store project context summary in Serena Memory using `write_memory`

   **Step 7.3: Cross-Reference**

   - Link Memory Bank entries with Serena Memory entry

8. **Verify Initialization Completeness** (NEW)
   - Verify Memory Bank structure is complete
   - Verify Serena onboarding is complete (if performed)
   - Verify complexity level is determined
   - Verify context is stored in both systems
   - If incomplete, return to appropriate step

## Usage

Type `/van` followed by your task description or initialization request.

Example:

```
/van Initialize project for adding user authentication feature
```

## Serena MCP Integration

This command integrates with Serena MCP tools for enhanced project exploration and token efficiency:

- **Onboarding**: Use `check_onboarding_performed` and `onboarding` to initialize Serena project context
- **Structure Exploration**: Use `list_dir` and `find_file` instead of reading entire directories
- **Memory Integration**: Store project context in both Memory Bank and Serena Memory

For detailed integration strategies, see:

- `@serena-integration.mdc` - Complete integration guide
- `@serena-integration-examples.mdc` - Practical examples

**Token Efficiency**: Using Serena tools can reduce token usage by 40-60% compared to reading entire files.

## Next Steps

- **Level 1 tasks:** Proceed directly to `/build` command
- **Level 2-4 tasks:** Use `/plan` command for detailed planning
