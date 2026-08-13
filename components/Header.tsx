'use client';

import { useEffect, useState } from 'react';

const NAV_ITEMS = [
  { href: '#home', label: 'Home' },
  { href: '#about', label: 'About' },
  { href: '#services', label: 'Services' },
  { href: '#impact', label: 'Impact' },
  { href: '#community', label: 'Community' },
  { href: '#resources', label: 'Resources' },
  { href: '#faqs', label: 'FAQs' },
  { href: '#contact', label: 'Contact' },
];

export default function Header() {
  const [scrolled, setScrolled] = useState(false);
  const [open, setOpen] = useState(false);
  const [active, setActive] = useState('home');

  useEffect(() => {
    function onScroll() {
      setScrolled(window.scrollY > 24);
    }
    document.addEventListener('scroll', onScroll, { passive: true });
    onScroll();
    return () => document.removeEventListener('scroll', onScroll);
  }, []);

  useEffect(() => {
    const sections = Array.from(document.querySelectorAll('section[id]'));
    if (!sections.length) return;

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) setActive(entry.target.id);
        });
      },
      { rootMargin: '-45% 0px -50% 0px', threshold: 0 }
    );

    sections.forEach((section) => observer.observe(section));
    return () => observer.disconnect();
  }, []);

  return (
    <header className={`site-header${scrolled ? ' is-scrolled' : ''}`}>
      <div className="container">
        <a href="#home" className="brand">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img src="/logo-white.png" alt="Triift Africa" className="brand-logo" />
        </a>

        <nav className={`nav-links${open ? ' is-open' : ''}`} id="navLinks" aria-label="Primary">
          {NAV_ITEMS.map((item) => (
            <a
              key={item.href}
              href={item.href}
              className={active === item.href.slice(1) ? 'is-active' : ''}
              onClick={() => setOpen(false)}
            >
              {item.label}
            </a>
          ))}
        </nav>

        <div className="nav-cta">
          <a href="#resources" className="btn btn-ghost-dark btn-sm">Get resources</a>
          <a href="https://docs.google.com/forms/d/e/1FAIpQLSfDVrqbojRBF49hPRM4cDkbDYJOYUhztw1yDjx4LX9ijh72Kw/alreadyresponded" target="_blank" rel="noopener noreferrer" className="btn btn-primary btn-sm">Join community</a>
          <button
            type="button"
            className="nav-toggle"
            aria-label="Toggle menu"
            aria-expanded={open}
            aria-controls="navLinks"
            onClick={() => setOpen((value) => !value)}
          >
            <svg width="18" height="12" viewBox="0 0 18 12" fill="none">
              <path d="M0 1H18M0 6H18M0 11H18" stroke="currentColor" strokeWidth="1.5" />
            </svg>
          </button>
        </div>
      </div>
    </header>
  );
}
