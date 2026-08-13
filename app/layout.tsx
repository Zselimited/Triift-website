import type { Metadata } from 'next';
import { Fraunces, Plus_Jakarta_Sans, IBM_Plex_Mono } from 'next/font/google';
import './globals.css';

const fraunces = Fraunces({
  subsets: ['latin'],
  variable: '--font-display',
  weight: ['500', '600', '700'],
  style: ['normal', 'italic'],
  display: 'swap',
});

const plusJakarta = Plus_Jakarta_Sans({
  subsets: ['latin'],
  variable: '--font-body',
  weight: ['400', '500', '600', '700', '800'],
  display: 'swap',
});

const plexMono = IBM_Plex_Mono({
  subsets: ['latin'],
  variable: '--font-mono',
  weight: ['400', '500', '600'],
  display: 'swap',
});

const siteUrl = 'https://triiftafrica.com';

export const metadata: Metadata = {
  metadataBase: new URL(siteUrl),
  title: {
    default: 'Triift Africa | Community, Training and Growth for African Entrepreneurs',
    template: '%s | Triift Africa',
  },
  description:
    'Triift Africa helps nano and micro business owners across Africa access training, mentorship, resources and a thriving entrepreneur community.',
  keywords: [
    'business community Africa',
    'entrepreneur mentorship Africa',
    'START Accelerator Program',
    'small business training Nigeria',
  ],
  alternates: {
    canonical: '/',
  },
  openGraph: {
    type: 'website',
    url: siteUrl,
    siteName: 'Triift Africa',
    title: 'Triift Africa | Driving the Growth of African Businesses',
    description:
      'Community, training and resources for nano and micro business owners across Africa.',
    locale: 'en_NG',
    images: [{ url: '/og-image.jpg', width: 1200, height: 630, alt: 'Triift Africa' }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Triift Africa | Driving the Growth of African Businesses',
    description:
      'We make it easy for small business owners in Africa to access community support and resources to go from struggling to thriving.',
  },
  robots: {
    index: true,
    follow: true,
  },
  icons: {
    icon: '/icon.png',
    shortcut: '/icon.png',
    apple: '/icon.png',
  },
};

const organizationSchema = {
  '@context': 'https://schema.org',
  '@type': 'Organization',
  name: 'Triift Africa',
  url: siteUrl,
  logo: `${siteUrl}/logo-purple.png`,
  description:
    'Triift Africa supports nano and micro business owners across Africa through community, training, mentorship and practical resources.',
  email: 'triiftafrica@gmail.com',
  telephone: '+2349035333965',
  areaServed: 'Africa',
  sameAs: [
    'https://medium.com/@triiftafrica',
    'https://selar.com/m/TriiftAfrica',
    'https://www.linkedin.com/company/triiftafrica/',
    'https://www.instagram.com/triiftafrica',
    'https://www.facebook.com/TriiftAfrica',
    'https://x.com/triiftafrica',
  ],
};

const faqSchema = {
  '@context': 'https://schema.org',
  '@type': 'FAQPage',
  mainEntity: [
    {
      '@type': 'Question',
      name: 'What does Triift Africa help with?',
      acceptedAnswer: {
        '@type': 'Answer',
        text: 'We help nano and micro business owners grow through community, training and mentorship, and practical resources, without requiring any funding or financial product.',
      },
    },
    {
      '@type': 'Question',
      name: 'What is the Triift Community?',
      acceptedAnswer: {
        '@type': 'Answer',
        text: 'A network of entrepreneurs, mentors, and growth partners working together to build successful African businesses. Members get access to training, opportunities, and exclusive resources.',
      },
    },
    {
      '@type': 'Question',
      name: 'Is Triift Africa only for Nigerians?',
      acceptedAnswer: {
        '@type': 'Answer',
        text: 'Not at all. While many of our programs started in Nigeria, we are expanding across Africa, with members in Ghana, Malawi, and beyond.',
      },
    },
  ],
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${fraunces.variable} ${plusJakarta.variable} ${plexMono.variable}`}>
      <body>
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(organizationSchema) }}
        />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(faqSchema) }}
        />
        {children}
      </body>
    </html>
  );
}
