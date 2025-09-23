# Twenty Twenty Five default theme demo blueprint. 

This is the example code for the WordPress Developer article: How to build a Theme demo blueprint for WordPress Playground

 
![Demo Content](/media/screenshot-2025-09-23.png)

## Importer versions

[You can test is right here w/ playground](https://playground.wordpress.net/?blueprint-url=https://raw.githubusercontent.com/wptrainingteam/tt5-demo-blueprint/main/blueprint.json)

The first version of  the content ran into a bug that still needs to be fixed. 
I tried now a second version of content. 

Still a work in progress.

## URL Replacement Script

The `replace_urls.sh` script is included to help replace URL patterns in the `playground-content.xml` file.

### Usage

**Interactive mode with defaults:**
```bash
./replace_urls.sh
```
You'll be prompted to enter URLs, with default values shown in brackets. Press Enter to use the defaults.

**Automatic mode with defaults:**
```bash
./replace_urls.sh --use-defaults
```
Uses the hardcoded default values without prompting:
- Find: `http://localhost:8881/wp-content/uploads/2025/09/`
- Replace: `https://raw.githubusercontent.com/wptrainingteam/tt5-demo-blueprint/main/media/`

The script creates a backup of the original file as `playground-content.xml.bak` before making changes.

