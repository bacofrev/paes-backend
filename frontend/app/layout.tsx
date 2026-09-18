import type { Metadata } from "next";
import { Manrope, IBM_Plex_Mono, Fraunces } from "next/font/google";
import "katex/dist/katex.min.css";
import "./globals.css";

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
  title: "PAES — práctica",
  description: "Práctica de un nodo PAES",
};

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html
      lang="es"
      className={`${manrope.variable} ${ibmPlexMono.variable} ${fraunces.variable}`}
    >
      <body>{children}</body>
    </html>
  );
}
