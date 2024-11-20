# Vue 3 + Vuetify 3 Template

🚀 A modern, feature-rich template for building Vue 3 applications with Vuetify 3, TypeScript, and best practices.

## ✨ Features

### 🎯 Core Technologies
- [Vue 3](https://v3.vuejs.org/) - The Progressive JavaScript Framework
- [Vuetify 3](https://vuetifyjs.com/) - Material Design Framework for Vue
- [TypeScript](https://www.typescriptlang.org/) - JavaScript with syntax for types
- [Vite](https://vitejs.dev/) - Next Generation Frontend Tooling

## 🏗️ Project Architecture

### Feature-Sliced Design (FSD)

This project follows [Feature-Sliced Design](https://feature-sliced.design/) methodology - an architectural methodology for building frontend applications. FSD provides a structured approach to organizing code that scales with your project.

#### 🔍 Layer Organization

```
src/
├── app/          # Application initialization layer
│   ├── providers/    # Composition providers
│   ├── styles/      # Global styles
│   └── router/      # Router setup
│
├── pages/        # Compositional layer: Pages
│   └── home/        # /home page
│   └── about/       # /about page
│
├── widgets/      # Compositional layer: Complex components
│   └── header/      # Header widget
│   └── sidebar/     # Sidebar widget
│
├── features/     # Business logic layer
│   └── auth/        # Authentication feature
│   └── theme/       # Theme switching
│
├── entities/     # Business entities layer
│   └── user/        # User entity
│   └── product/     # Product entity
│
└── shared/       # Reusable infrastructure layer
    ├── api/         # API clients
    ├── config/      # Configuration
    ├── lib/         # External libraries
    └── ui/          # UI components
```
### Key Directories
- `src/app/styles/` - Global styles and theme configuration
- `src/shared/ui/` - Reusable UI components
- `src/shared/lib/` - Utility functions and helpers
- `src/shared/api/` - API integration layer

#### 🔗 Import Rules

FSD enforces strict import rules:
- ⬇️ Layers can only import from layers below them
- ⛔ Circular dependencies are prohibited
- 📦 Shared code goes into the `shared` layer

Learn more about FSD:
- 📚 [Official Documentation](https://feature-sliced.design/docs)
- 🎓 [Why FSD?](https://feature-sliced.design/docs/get-started/why)
- 🛠️ [Migration Guide](https://feature-sliced.design/docs/get-started/migration)

### 🛠️ Development Tools
- 🔍 **TypeScript** - Full type safety
- 📝 **ESLint** - Code quality and consistency
- 🧪 **Commitlint** - Conventional commit messages
- 🔄 **Git Hooks** - Automated code quality checks

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- npm

### Creating New Project

```bash
# Clone and setup new project
./setup-project.sh my-project-name

# Navigate to project
cd my-project-name

# Start development server
npm run dev
```

### Manual Installation

```bash
# Clone the repository
git clone https://github.com/Timur000101/vue3-fsd-vuetify-template.git

# Navigate to project folder
cd vue3-fsd-vuetify-template

# Install dependencies
npm install

# Start development server
npm run dev
```

## 📚 Available Scripts

| Command | Description |
|---------|-------------|
| `npm run dev` | Start development server |
| `npm run build` | Build for production |
| `npm run preview` | Preview production build |
| `npm run lint` | Run ESLint |
| `npm run lint:fix` | Fix ESLint errors |
| `npm run type-check` | Run TypeScript type checking |

## 🔧 Configuration

### Environment Variables
Create `.env` file in the root directory:
```env
VITE_API_URL=your_api_url
```

### TypeScript
TypeScript configuration is split into:
- `tsconfig.json` - Base configuration
- `tsconfig.app.json` - Application-specific settings
- `tsconfig.node.json` - Node.js specific settings

### ESLint
ESLint is configured with:
- @antfu/eslint-config

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 Commit Convention

This project follows [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` - New features
- `fix:` - Bug fixes
- `docs:` - Documentation changes
- `style:` - Code style changes
- `refactor:` - Code refactoring
- `perf:` - Performance improvements
- `test:` - Tests
- `chore:` - Maintenance

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Vuetify](https://vuetifyjs.com/) - Material Design Framework
- [Feature-Sliced Design](https://feature-sliced.design/) - Architecture Methodology
- [Vite](https://vitejs.dev/) - Build Tool
- [TypeScript](https://www.typescriptlang.org/) - Type System

---

Made with ❤️ by Temur.K
