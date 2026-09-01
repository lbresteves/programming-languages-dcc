import { defineConfig } from 'fumadocs-mdx/config';
import type { LanguageRegistration } from 'shiki';
import smlGrammar from './lib/sml.tmLanguage.json';

// O Shiki (realçador do Fumadocs) não traz gramática para SML, a linguagem
// mais usada nas anotações. Registramos uma gramática TextMate própria
// (`lib/sml.tmLanguage.json`, copiada do projeto Millet — ver .LICENSE.md).
export default defineConfig({
  mdxOptions: {
    rehypeCodeOptions: {
      themes: {
        light: 'github-light',
        dark: 'github-dark',
      },
      langs: [smlGrammar as unknown as LanguageRegistration],
    },
  },
});
