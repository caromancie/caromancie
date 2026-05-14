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
  git push

  echo ""
  echo "✅ Envoyé!"
else
  echo "❌ Annulé"
fi
