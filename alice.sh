
#!/bin/bash

##############################################################################
#                    ALICE - Alias Maker for Linux                          #
#              Advanced Linux Command Installer & Executor                  #
##############################################################################

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Detect shell and config file
detect_shell() {
    if [[ -n "$ZSH_VERSION" ]]; then
        CONFIG_FILE="$HOME/.zshrc"
    else
        CONFIG_FILE="$HOME/.bashrc"
    fi
}

# Initialize - ensure .bash_aliases exists and is sourced
initialize() {
    detect_shell
    
    # Create .bash_aliases if it doesn't exist
    if [[ ! -f "$HOME/.bash_aliases" ]]; then
        touch "$HOME/.bash_aliases"
        echo -e "${GREEN}✅ Created $HOME/.bash_aliases${NC}"
    fi
    
    # Ensure .bash_aliases is sourced in both .bashrc and .zshrc
    if [[ ! -f "$HOME/.bashrc" ]]; then
        touch "$HOME/.bashrc"
    fi
    
    if ! grep -q "source.*\.bash_aliases" "$HOME/.bashrc" 2>/dev/null; then
        echo "" >> "$HOME/.bashrc"
        echo "# Source aliases" >> "$HOME/.bashrc"
        echo "if [ -f ~/.bash_aliases ]; then" >> "$HOME/.bashrc"
        echo "    source ~/.bash_aliases" >> "$HOME/.bashrc"
        echo "fi" >> "$HOME/.bashrc"
    fi
    
    if [[ ! -f "$HOME/.zshrc" ]]; then
        touch "$HOME/.zshrc"
    fi
    
    if ! grep -q "source.*\.bash_aliases" "$HOME/.zshrc" 2>/dev/null; then
        echo "" >> "$HOME/.zshrc"
        echo "# Source aliases" >> "$HOME/.zshrc"
        echo "if [ -f ~/.bash_aliases ]; then" >> "$HOME/.zshrc"
        echo "    source ~/.bash_aliases" >> "$HOME/.zshrc"
        echo "fi" >> "$HOME/.zshrc"
    fi
}

# Display header
header() {
    clear
    echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${NC}     ${CYAN}🔧 ALICE - Alias Maker for Linux 🔧${NC}                    ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${NC}     ${YELLOW}Create Permanent Command Aliases${NC}                       ${PURPLE}║${NC}"
    echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Create new alias
create_alias() {
    header
    echo -e "${GREEN}📝 Create New Alias${NC}"
    echo ""
    
    read -p "$(echo -e ${YELLOW}Alias name${NC}) (e.g., ll, gs): " alias_name
    
    if [[ -z "$alias_name" ]]; then
        echo -e "${RED}❌ Error: Alias name cannot be empty${NC}"
        sleep 2
        return
    fi
    
    if ! [[ "$alias_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        echo -e "${RED}❌ Error: Invalid characters${NC}"
        sleep 2
        return
    fi
    
    read -p "$(echo -e ${YELLOW}Command${NC}) (e.g., ls -la): " command
    
    if [[ -z "$command" ]]; then
        echo -e "${RED}❌ Error: Command cannot be empty${NC}"
        sleep 2
        return
    fi
    
    echo ""
    echo -e "${YELLOW}Preview:${NC} alias $alias_name='$command'"
    echo ""
    read -p "Create this alias? (y/n): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        return
    fi
    
    # Remove if exists
    sed -i "/^alias $alias_name=/d" "$HOME/.bash_aliases"
    
    # Add new alias
    echo "alias $alias_name='$command'" >> "$HOME/.bash_aliases"
    
    # Load immediately
    source "$HOME/.bash_aliases"
    
    echo -e "${GREEN}✅ Alias created successfully!${NC}"
    echo -e "${CYAN}[INFO]${NC} Saved to: $HOME/.bash_aliases"
    echo -e "${YELLOW}[TIP]${NC} Alias is active in all new terminal windows${NC}"
    echo ""
    read -p "Press Enter to continue..."
}

# List aliases
list_aliases() {
    header
    echo -e "${GREEN}📋 All Aliases${NC}"
    echo ""
    
    if [[ ! -f "$HOME/.bash_aliases" ]] || [[ ! -s "$HOME/.bash_aliases" ]]; then
        echo -e "${YELLOW}No aliases found${NC}"
    else
        echo -e "${CYAN}Your aliases:${NC}"
        echo ""
        cat "$HOME/.bash_aliases" | nl
    fi
    
    echo ""
    read -p "Press Enter to continue..."
}

# Remove alias
remove_alias() {
    header
    echo -e "${RED}🗑️  Remove Alias${NC}"
    echo ""
    
    read -p "Alias name to remove: " alias_name
    
    if [[ -z "$alias_name" ]]; then
        echo -e "${RED}❌ Error: Alias name cannot be empty${NC}"
        sleep 2
        return
    fi
    
    if ! grep -q "^alias $alias_name=" "$HOME/.bash_aliases"; then
        echo -e "${RED}❌ Alias not found${NC}"
        sleep 2
        return
    fi
    
    echo -e "${YELLOW}Found:${NC} $(grep "^alias $alias_name=" "$HOME/.bash_aliases")"
    echo ""
    read -p "Remove this alias? (y/n): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        return
    fi
    
    sed -i "/^alias $alias_name=/d" "$HOME/.bash_aliases"
    unalias "$alias_name" 2>/dev/null
    
    echo -e "${GREEN}✅ Alias removed${NC}"
    sleep 1
}

# View alias
view_alias() {
    header
    echo -e "${BLUE}🔍 View Alias${NC}"
    echo ""
    
    read -p "Alias name: " alias_name
    
    if [[ -z "$alias_name" ]]; then
        echo -e "${RED}❌ Empty name${NC}"
        sleep 2
        return
    fi
    
    if ! grep -q "^alias $alias_name=" "$HOME/.bash_aliases"; then
        echo -e "${RED}❌ Not found${NC}"
        sleep 2
        return
    fi
    
    grep "^alias $alias_name=" "$HOME/.bash_aliases"
    echo ""
    read -p "Press Enter to continue..."
}

# Main menu
while true; do
    header
    echo -e "${BLUE}┌─ Main Menu ─────────────────────────────────────────────────┐${NC}"
    echo -e "${BLUE}│${NC} ${GREEN}1)${NC} Create New Alias                                         ${BLUE}│${NC}"
    echo -e "${BLUE}│${NC} ${GREEN}2)${NC} List All Aliases                                         ${BLUE}│${NC}"
    echo -e "${BLUE}│${NC} ${GREEN}3)${NC} Remove Alias                                             ${BLUE}│${NC}"
    echo -e "${BLUE}│${NC} ${GREEN}4)${NC} View Alias                                               ${BLUE}│${NC}"
    echo -e "${BLUE}│${NC} ${GREEN}0)${NC} Exit                                                     ${BLUE}│${NC}"
    echo -e "${BLUE}└─────────────────────────────────────────────────────────────┘${NC}"
    echo ""
    
    read -p "$(echo -e ${YELLOW}Select option${NC}): " choice
    
    case $choice in
        1) create_alias ;;
        2) list_aliases ;;
        3) remove_alias ;;
        4) view_alias ;;
        0) echo -e "${GREEN}Goodbye!${NC}"; exit 0 ;;
        *) echo -e "${RED}Invalid option${NC}"; sleep 1 ;;
    esac
done
