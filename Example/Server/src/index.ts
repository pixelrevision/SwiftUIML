import express, { Request, Response } from "express";
import { buttonsDemo } from "./pages/buttons-demo";
import { imagesDemo } from "./pages/images-demo";
import { layoutDemo } from "./pages/layout-demo";
import { messagingDemo } from "./pages/messaging-demo";
import { navigationDemo } from "./pages/navigation-demo";
import { shapesDemo } from "./pages/shapes-demo";
import { stylesDemo } from "./pages/styles-demo";
import { textDemo } from "./pages/text-demo";
import { recentFeaturesDemo } from "./pages/recent-features";
import { welcome } from "./pages/welcome";

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// Pages
app.get("/", (req: Request, res: Response) => {
  res.json(welcome());
});

app.get("/text-demo", (req: Request, res: Response) => {
  res.json(textDemo());
});

app.get("/buttons-demo", (req: Request, res: Response) => {
  res.json(buttonsDemo());
});

app.get("/layout-demo", (req: Request, res: Response) => {
  res.json(layoutDemo());
});

app.get("/images-demo", (req: Request, res: Response) => {
  res.json(imagesDemo());
});

app.get("/shapes-demo", (req: Request, res: Response) => {
  res.json(shapesDemo());
});

app.get("/styles-demo", (req: Request, res: Response) => {
  res.json(stylesDemo());
});

app.get("/messaging-demo", (req: Request, res: Response) => {
  res.json(messagingDemo());
});

app.get("/navigation-demo", (req: Request, res: Response) => {
  const target = req.query.target as string | undefined;
  const presented = req.query.presented !== "false"; // defaults to true unless explicitly false
  res.json(navigationDemo(target, presented));
});

app.get("/recent-features", (req: Request, res: Response) => {
  res.json(recentFeaturesDemo());
});

// Start server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
  console.log(`\nAvailable pages:`);
  console.log(`  / - Welcome`);
  console.log(`  /text-demo - Text & Typography`);
  console.log(`  /buttons-demo - Buttons & Actions`);
  console.log(`  /layout-demo - Layout Containers`);
  console.log(`  /images-demo - Images & Media`);
  console.log(`  /shapes-demo - Shapes & Graphics`);
  console.log(`  /styles-demo - Styles & Layouts`);
  console.log(`  /messaging-demo - Messaging System`);
  console.log(`  /navigation-demo - Navigation (Sheets & More)`);
  console.log(`  /recent-features - Recent Feature Additions`);
});
