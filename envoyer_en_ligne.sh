#!/bin/bash

echo "📦 Statut actuel:"
git status

echo ""
echo "================================"
read -p "Continuer l'envoi ? (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
  read -p "Message de commit: " message

  if [ -z "$message" ]; then
    message="Update changes"
  fi

  echo ""
  echo "🚀 Envoi en cours..."
  git add -A
  git commit -m "$message"

  if ! git push 2>&1 | grep -q "no upstream"; then
    echo "✅ Envoyé!"
  else
    echo "⚠️  Pas d'upstream, je le configure..."
    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream origin "$BRANCH"
    echo "✅ Envoyé!"
  fi
else
  echo "❌ Annulé"
fi
