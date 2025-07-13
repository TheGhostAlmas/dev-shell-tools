# 🛠️ Shell Functions for Developers

Colección de funciones útiles para desarrolladores en Bash, diseñadas para agilizar tareas comunes como iniciar un servidor HTTP rápido, limpiar historial, clonar repositorios de forma eficiente, y eliminar metadatos de archivos.

> ✅ Multi-idioma: Comentarios y uso disponibles en **inglés y español**.

---

## 📦 Funciones Incluidas

### 🌐 `serve_http`
Inicia un servidor HTTP simple en el puerto **8080** utilizando Python.

```bash
serve_http
```

> 🧪 Útil para pruebas rápidas o compartir archivos por red local.

---

### 🧹 `clean_logs`
Limpia el historial de comandos del shell actual y del archivo `.bash_history`.

```bash
clean_logs
```

> ⚠️ ¡Advertencia! Esta acción **no se puede deshacer**.

---

### ⚡ `gitfast`
Clona un repositorio Git con `--depth=1` para mayor velocidad e ingresa directamente al directorio clonado.

```bash
gitfast <repo-url>
```

> Ejemplo:
```bash
gitfast https://github.com/user/repo.git
```

---

### 🧼 `metaclean`
Elimina metadatos de archivos utilizando `exiftool`.

```bash
metaclean <archivo>
```

> Requiere tener `exiftool` instalado:
```bash
sudo apt install exiftool     # Debian/Ubuntu
brew install exiftool         # macOS
```

---

## 🔧 Instalación

1. **Identifica tu shell:**

```bash
echo $SHELL
```

2. **Agrega el script a tu archivo de configuración:**

| Shell | Archivo de configuración |
|-------|--------------------------|
| bash  | `~/.bashrc`              |
| zsh   | `~/.zshrc`               |

```bash
# Ejemplo:
source /ruta/a/shell-functions.sh
```

3. **Recarga tu configuración:**

```bash
source ~/.bashrc   # o source ~/.zshrc
```

---

## 🧑‍💻 Autor

Desarrollado por [TheGhostAlmas].  
Si te fue útil, ¡dale una estrella ⭐ en GitHub!

---

## 📜 Licencia

Este proyecto está licenciado bajo la [MIT License](LICENSE).
