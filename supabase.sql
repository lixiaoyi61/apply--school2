-- 在 Supabase 项目的 SQL Editor 中完整运行此文件。
create table if not exists public.schools (
  id text primary key,
  region text not null check (region in ('us', 'uk', 'sg')),
  category text not null check (category in ('reach', 'match', 'safety')),
  name text not null default '',
  status text not null default '未开始',
  info jsonb not null default '[]'::jsonb,
  position integer not null default 0,
  updated_at timestamptz not null default now()
);

alter table public.schools enable row level security;

drop policy if exists "public can read schools" on public.schools;
create policy "public can read schools" on public.schools for select to anon using (true);

drop policy if exists "public can insert schools" on public.schools;
create policy "public can insert schools" on public.schools for insert to anon with check (true);

drop policy if exists "public can update schools" on public.schools;
create policy "public can update schools" on public.schools for update to anon using (true) with check (true);

drop policy if exists "public can delete schools" on public.schools;
create policy "public can delete schools" on public.schools for delete to anon using (true);

alter publication supabase_realtime add table public.schools;
