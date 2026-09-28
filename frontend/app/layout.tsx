import type { Metadata } from "next";
import { Manrope, IBM_Plex_Mono, Fraunces } from "next/font/google";
// Must be the same KaTeX major/minor that rehype-katex renders with:
// 0.18 renamed its classes (.sizing -> .katex-sizing), so a newer CSS
// over 0.16 markup leaves exponents full size. Bump both together.
import "katex/dist/katex.min.css";
import "./globals.css";
import AuthProvider from "./AuthProvider";

const manrope = Manrope({
  variable: "--font-manrope",
  subsets: ["latin"],
});

const ibmPlexMono = IBM_Plex_Mono({
  variable: "--font-ibm-plex-mono",
  subsets: ["latin"],
  weight: ["400", "500"],
});

const fraunces = Fraunces({
  variable: "--font-fraunces",
  subsets: ["latin"],
  weight: ["600"],
});

export const metadata: Metadata = {
  title: "rankup",
  description: "Preparación PAES",
};

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html
      lang="es"
      className={`${manrope.variable} ${ibmPlexMono.variable} ${fraunces.variable}`}
    >
      <body>
        <AuthProvider>{children}</AuthProvider>
      </body>
    </html>
  );
}
