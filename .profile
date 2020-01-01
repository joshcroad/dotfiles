# If running bash
if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi

    if [ -f "$HOME/.bash_profile" ]; then
      . "$HOME/.bash_profile"
    fi
fi
