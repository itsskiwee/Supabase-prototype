create policy "Public read team members"
on public.team_members
for select
to anon, authenticated
using (true);
