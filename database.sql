create table if not exists public.team_members (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  role text not null,
  image text,
  bio text not null default 'Building cool stuff.',
  department text not null default 'Technology',
  socials jsonb not null default jsonb_build_object('github', null, 'linkedin', null),
  "createdAt" timestamptz not null default now()
);

alter table public.team_members
  add constraint socials_has_keys
  check (
    socials ? 'github'
    and socials ? 'linkedin'
  );

create index if not exists team_members_department_idx
  on public.team_members (department);

create index if not exists team_members_createdat_idx
  on public.team_members ("createdAt" desc);
