alter table public.team_members enable row level security;

drop policy if exists "Public read team members" on public.team_members;
create policy "Public read team members"
on public.team_members
for select
to anon, authenticated
using (true);

drop policy if exists "Authenticated insert team members" on public.team_members;
create policy "Authenticated insert team members"
on public.team_members
for insert
to authenticated
with check (true);

drop policy if exists "Authenticated update team members" on public.team_members;
create policy "Authenticated update team members"
on public.team_members
for update
to authenticated
using (true)
with check (true);

drop policy if exists "Authenticated delete team members" on public.team_members;
create policy "Authenticated delete team members"
on public.team_members
for delete
to authenticated
using (true);
