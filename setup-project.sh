#!/bin/bash

# Text colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Spinner function
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Execute command with spinner
execute_with_spinner() {
    local message=$1
    local command=$2
    echo -ne "${BLUE}$message${NC}"
    eval "$command" &
    spinner $!
    echo -e "${GREEN}✓${NC}"
}

# Print colored message
print_message() {
    echo -e "${BLUE}$1${NC}"
}

# Print success message
print_success() {
    echo -e "${GREEN}$1${NC}"
}

# Print error message
print_error() {
    echo -e "${RED}$1${NC}"
}

# Function to update package.json based on OS
update_package_json() {
    local project_name=$1
    
    case "$OSTYPE" in
        "darwin"*)
            # macOS
            sed -i '' "s/\"name\": \".*\"/\"name\": \"$project_name\"/" package.json
            ;;
        "linux-gnu"*)
            # Linux
            sed -i "s/\"name\": \".*\"/\"name\": \"$project_name\"/" package.json
            ;;
        "msys"*|"cygwin"*)
            # Windows Git Bash
            temp_file=$(mktemp)
            sed "s/\"name\": \".*\"/\"name\": \"$project_name\"/" package.json > "$temp_file"
            mv "$temp_file" package.json
            ;;
        *)
            print_error "❌ Unknown operating system"
            exit 1
            ;;
    esac
}


# Check if project name is provided
if [ -z "$1" ]; then
    print_error "❌ Please provide a project name!"
    echo "📝 Usage: ./setup-project.sh <project-name>"
    exit 1
fi

PROJECT_NAME=$1
TEMPLATE_DIR=$(pwd)
PARENT_DIR=$(dirname "$TEMPLATE_DIR")

echo -e "\n🚀 Starting project setup...\n"

# Create new project directory at the same level as template
print_message "📁 Creating new project directory: $PROJECT_NAME"

# Copy files without spinner (more reliable on Windows)
cd "$PARENT_DIR" || exit
cp -r "$(basename "$TEMPLATE_DIR")" "$PROJECT_NAME"
echo -e "${GREEN}✓${NC}"

# Check if directory was created successfully
if [ ! -d "$PROJECT_NAME" ]; then
    print_error "❌ Failed to create project directory!"
    exit 1
fi

# Navigate to the new project directory
cd "$PROJECT_NAME" || exit

# Remove .git directory
execute_with_spinner "🧹 Cleaning up git history..." "rm -rf .git"

# Remove setup script
execute_with_spinner "🪚 Removing setup script..." "rm -f setup-project.sh"

# Update project name in package.json
execute_with_spinner "📝 Updating project configuration..." "update_package_json \"$PROJECT_NAME\""

# Initialize new git repository
execute_with_spinner "🔧 Initializing new git repository..." "git init"

# Install dependencies
print_message "\n📦 Installing dependencies using npm..."
execute_with_spinner "Installing packages..." "npm install"

echo -e "\n${GREEN}✨ Project setup complete! ✨${NC}"
print_success "🎉 Your new project is ready at: $PARENT_DIR/$PROJECT_NAME"
echo -e "\n${BLUE}📝 Next steps:${NC}"
echo "1. cd $PROJECT_NAME"
echo "2. $PACKAGE_MANAGER run dev"
echo -e "\n${GREEN}Happy coding! 🚀${NC}\n"