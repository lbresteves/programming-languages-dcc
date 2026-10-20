import Link from 'next/link';
import { githubProfile, githubRepo } from '@/lib/shared';

export default function HomePage() {
  return (
    <div className="flex flex-col justify-center text-center flex-1">
      <h1 className="text-2xl font-bold mb-4">DCC024 — Linguagens de Programação</h1>
      <p>
        Anotações de aula. Comece por{' '}
        <Link href="/docs" className="font-medium underline">
          /docs
        </Link>
        .
      </p>
      <p className="mt-6 text-sm text-fd-muted-foreground">
        Feito por{' '}
        <a href={githubProfile} target="_blank" rel="noreferrer" className="font-medium underline">
          @lbresteves
        </a>
        . Se te ajudou, deixa uma ⭐ no{' '}
        <a href={githubRepo} target="_blank" rel="noreferrer" className="font-medium underline">
          repositório
        </a>
        !
      </p>
    </div>
  );
}
