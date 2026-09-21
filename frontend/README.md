# Frontend

React and TypeScript application scaffolded with Vite.

## Run the dev server

From the repository root:

```powershell
Copy-Item frontend/.env.example frontend/.env
npm install --prefix frontend
npm run dev --prefix frontend
```

Open the local URL printed by Vite. The default Vite starting page should be
visible in the browser.

## Quality checks

```powershell
npm run lint --prefix frontend
npm run format:check --prefix frontend
npm run build --prefix frontend
```
