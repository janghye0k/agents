# cursor-memory-bank Serena Extension

Extension rules that combine [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) with [Serena MCP](https://github.com/oraios/serena). Memory Bank path can be overridden to `.serena/memories/memory-bank`, and file operations on Memory Bank prefer Serena MCP tools.

## Purpose

- **Path override:** When `.serena/memories` exists at the project root, the Memory Bank root is `.serena/memories/memory-bank` instead of `memory-bank/`.
- **Tool preference:** For Memory Bank file read/update, prefer Serena MCP (`list_dir`, `find_file`, `search_for_pattern`, `replace_content`). Use standard tools for create/delete when Serena has no equivalent.

## Rule Files

| File                                   | Role                                                                                                                                                                    |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Core/memory-bank-path-override.mdc`   | Defines effective Memory Bank root (`.serena/memories/memory-bank` when `.serena/memories` exists, else `memory-bank`). Lists canonical paths and verification mandate. |
| `Core/memory-bank-serena-file-ops.mdc` | For files under the effective root: prefer Serena MCP for listing, finding, searching, and editing; use Write/Delete for create/delete.                                 |

## Loading

Place or link `isolation_rules` so Cursor loads it together with cursor-memory-bank’s isolation_rules (e.g. include this repo’s `.cursor/rules/isolation_rules` in your project’s rule paths). No changes to cursor-memory-bank itself are required.

## Requirements

- Cursor with Serena MCP configured (e.g. in `mcp.json`).
- cursor-memory-bank commands and isolation_rules loaded in the same project.
