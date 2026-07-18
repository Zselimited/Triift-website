#!/usr/bin/env bash
set -e

mkdir -p app components

cat > app/globals.css << 'EOF'
:root {
  /* Brand purple pulled directly from the logo file (#412ECE) */
  --purple: #412ECE;
  --purple-bright: #5B45E5;
  --purple-deep: #2C1FA0;
  --purple-soft: #EEEBFC;

  /* Warm nude/gold accent, pairs with the purple instead of a hot orange */
  --nude: #D9B68C;
  --nude-deep: #C29A66;

  --paper: #FFFFFF;
  --paper-tint: #FAF8FC;
  --paper-raised: #FFFFFF;

  --text: #241B3D;
  --text-soft: #5B5270;
  --text-on-purple: #FFFFFF;
  --text-on-purple-soft: #D6CFFA;

  --line: rgba(36, 27, 61, 0.12);
  --line-on-purple: rgba(255, 255, 255, 0.18);
  --panel-on-purple: rgba(255, 255, 255, 0.07);

  --radius-sm: 6px;
  --radius-md: 14px;
  --radius-lg: 28px;
  --container: 1180px;
  --space-section: clamp(72px, 10vw, 140px);
}

* {
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

@media (prefers-reduced-motion: reduce) {
  html {
    scroll-behavior: auto;
  }
  *, *::before, *::after {
    animation-duration: 0.001ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.001ms !important;
    scroll-behavior: auto !important;
  }
}

body {
  margin: 0;
  font-family: var(--font-body), system-ui, sans-serif;
  color: var(--text);
  background: var(--paper);
  line-height: 1.6;
  -webkit-font-smoothing: antialiased;
  overflow-x: hidden;
}

img {
  max-width: 100%;
  display: block;
}

a {
  color: inherit;
  text-decoration: none;
}

ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

button {
  font-family: inherit;
}

h1, h2, h3, h4 {
  font-family: var(--font-display), Georgia, serif;
  font-weight: 600;
  line-height: 1.1;
  margin: 0;
  letter-spacing: -0.01em;
}

.mono {
  font-family: var(--font-mono), ui-monospace, Menlo, monospace;
}

em {
  font-style: italic;
  color: var(--nude-deep);
}

.container {
  max-width: var(--container);
  margin-inline: auto;
  padding-inline: clamp(20px, 5vw, 40px);
}

.eyebrow {
  font-family: var(--font-mono), monospace;
  font-size: 0.78rem;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--purple);
  display: inline-flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 18px;
}

.eyebrow::before {
  content: "";
  width: 22px;
  height: 1px;
  background: var(--nude-deep);
  display: inline-block;
}

.section-purple .eyebrow {
  color: var(--text-on-purple-soft);
}

:focus-visible {
  outline: 2px solid var(--nude-deep);
  outline-offset: 3px;
  border-radius: 4px;
}

/* Buttons */
.btn {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  padding: 15px 26px;
  border-radius: 100px;
  font-weight: 600;
  font-size: 0.95rem;
  border: 1px solid transparent;
  cursor: pointer;
  transition: transform 0.3s ease, background 0.25s ease, color 0.25s ease, border-color 0.25s ease;
  white-space: nowrap;
}

.btn:hover {
  transform: translateY(-2px);
}

.btn-primary {
  background: var(--nude);
  color: var(--text);
  box-shadow: 0 10px 24px -8px rgba(217, 182, 140, 0.6);
}

.btn-primary:hover {
  background: var(--nude-deep);
}

.btn-ghost-dark {
  background: transparent;
  color: var(--text-on-purple);
  border-color: var(--line-on-purple);
}

.btn-ghost-dark:hover {
  border-color: #fff;
}

.btn-sm {
  padding: 10px 18px;
  font-size: 0.85rem;
}

/* Header */
.site-header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  padding: 18px 0;
  transition: background 0.4s ease, padding 0.4s ease, box-shadow 0.4s ease;
}

.site-header.is-scrolled {
  background: rgba(65, 46, 206, 0.88);
  backdrop-filter: blur(14px) saturate(140%);
  padding: 12px 0;
  box-shadow: 0 10px 30px -18px rgba(44, 31, 160, 0.55);
}

.site-header .container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 24px;
}

.brand {
  display: flex;
  align-items: center;
}

.brand-logo {
  height: 32px;
  width: auto;
  display: block;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: clamp(14px, 2vw, 30px);
}

.nav-links a {
  position: relative;
  font-size: 0.92rem;
  font-weight: 500;
  color: var(--text-on-purple-soft);
  padding: 6px 2px;
  transition: color 0.25s ease;
}

.nav-links a::after {
  content: "";
  position: absolute;
  left: 0;
  right: 100%;
  bottom: -2px;
  height: 2px;
  background: var(--nude);
  border-radius: 2px;
  transition: right 0.35s ease;
}

.nav-links a:hover {
  color: #fff;
}

.nav-links a:hover::after,
.nav-links a.is-active::after {
  right: 0;
}

.nav-links a.is-active {
  color: #fff;
}

.nav-cta {
  display: flex;
  align-items: center;
  gap: 14px;
}

.nav-toggle {
  display: none;
  background: none;
  border: 1px solid var(--line-on-purple);
  color: #fff;
  width: 40px;
  height: 40px;
  border-radius: 8px;
  align-items: center;
  justify-content: center;
}

/* Section layout helpers */
section {
  position: relative;
}

.section-pad {
  padding-block: var(--space-section);
}

.section-purple {
  background: linear-gradient(160deg, var(--purple) 0%, var(--purple-deep) 100%);
  color: var(--text-on-purple);
}

.section-purple h2, .section-purple h3 {
  color: #fff;
}

.section-light {
  background: var(--paper);
}

.section-tint {
  background: var(--paper-tint);
}

.section-head {
  max-width: 640px;
  margin-bottom: 56px;
}

.section-head.center {
  margin-inline: auto;
  text-align: center;
}

.section-head p {
  color: var(--text-soft);
  font-size: 1.08rem;
  margin-top: 14px;
}

.section-purple .section-head p {
  color: var(--text-on-purple-soft);
}

/* Section divider: a simple gradient rule, no pattern/texture */
.section-divider {
  height: 4px;
  width: 100%;
  background: linear-gradient(90deg, var(--purple) 0%, var(--nude) 100%);
}

/* Stamp badge */
.stamp {
  display: inline-flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  gap: 6px;
  width: 128px;
  height: 128px;
  border-radius: 50%;
  border: 2px dashed rgba(255, 255, 255, 0.55);
  color: #fff;
  font-family: var(--font-mono), monospace;
  font-size: 0.68rem;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  transform: rotate(-9deg);
  transition: transform 0.5s ease;
  flex-shrink: 0;
  padding: 10px;
  background: var(--purple-deep);
}

.stamp:hover {
  transform: rotate(-2deg) scale(1.04);
}

/* Hero */
.hero {
  background: linear-gradient(160deg, var(--purple-bright) 0%, var(--purple) 45%, var(--purple-deep) 100%);
  color: var(--text-on-purple);
  padding-top: clamp(140px, 20vw, 200px);
  padding-bottom: 100px;
  position: relative;
  overflow: hidden;
}

.hero-grid {
  display: grid;
  grid-template-columns: 1.1fr 0.9fr;
  gap: clamp(32px, 6vw, 70px);
  align-items: center;
  position: relative;
  z-index: 1;
}

.hero h1 {
  font-size: clamp(2.4rem, 4.6vw, 4.1rem);
  color: #fff;
  margin-bottom: 22px;
}

.hero-lede {
  font-size: 1.15rem;
  color: var(--text-on-purple-soft);
  max-width: 52ch;
  margin-bottom: 34px;
}

.hero-ctas {
  display: flex;
  flex-wrap: wrap;
  gap: 14px;
  margin-bottom: 40px;
}

.hero-quote {
  font-family: var(--font-display), serif;
  font-style: italic;
  font-size: 1.05rem;
  color: #fff;
  border-left: 2px solid var(--nude);
  padding-left: 18px;
  max-width: 46ch;
  margin: 0;
}

.hero-quote cite {
  display: block;
  font-family: var(--font-mono), monospace;
  font-style: normal;
  font-size: 0.75rem;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  color: var(--text-on-purple-soft);
  margin-top: 10px;
}

.hero-visual {
  position: relative;
  aspect-ratio: 1 / 1;
  display: flex;
  align-items: center;
  justify-content: center;
}

.snapshot-card {
  position: relative;
  width: 88%;
  background: var(--paper-raised);
  color: var(--text);
  border-radius: var(--radius-lg);
  padding: 30px 28px;
  box-shadow: 0 40px 80px -30px rgba(44, 31, 160, 0.45);
  transform: rotate(2.5deg);
}

.snapshot-title {
  font-family: var(--font-mono), monospace;
  font-size: 0.72rem;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: var(--text-soft);
  display: flex;
  justify-content: space-between;
  border-bottom: 1px dashed var(--line);
  padding-bottom: 12px;
  margin-bottom: 14px;
}

.snapshot-row {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  padding: 10px 0;
  border-bottom: 1px dotted var(--line);
  font-family: var(--font-mono), monospace;
  font-size: 0.85rem;
}

.snapshot-row:last-child {
  border-bottom: none;
}

.snapshot-row .num {
  font-size: 1.15rem;
  font-weight: 600;
  color: var(--purple);
}

.hero-visual .stamp {
  position: absolute;
  top: -18px;
  right: -18px;
}

.float-chip {
  position: absolute;
  bottom: -22px;
  left: -18px;
  background: var(--nude);
  color: var(--text);
  padding: 14px 18px;
  border-radius: var(--radius-md);
  font-family: var(--font-mono), monospace;
  font-size: 0.78rem;
  box-shadow: 0 20px 40px -14px rgba(217, 182, 140, 0.7);
  transform: rotate(-3deg);
}

.float-chip strong {
  display: block;
  font-family: var(--font-display), serif;
  font-size: 1.3rem;
}

/* Trust strip */
.trust-strip {
  background: var(--purple-deep);
  padding: 26px 0;
}

.trust-strip .container {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  gap: 20px;
}

.trust-label {
  font-family: var(--font-mono), monospace;
  font-size: 0.72rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--text-on-purple-soft);
  white-space: nowrap;
}

.trust-logos {
  display: flex;
  flex-wrap: wrap;
  gap: clamp(20px, 4vw, 44px);
}

.trust-logos span {
  font-family: var(--font-display), serif;
  font-style: italic;
  font-size: 1.05rem;
  color: #fff;
  opacity: 0.9;
}

/* About */
.about-grid {
  display: grid;
  grid-template-columns: 0.85fr 1.15fr;
  gap: clamp(30px, 6vw, 80px);
  align-items: start;
}

.about-copy p {
  color: var(--text-soft);
  font-size: 1.05rem;
  margin: 0 0 16px;
}

.about-copy p:last-child {
  margin-bottom: 0;
}

.pull-list {
  margin-top: 28px;
  display: grid;
  gap: 14px;
}

.pull-list li {
  display: flex;
  gap: 12px;
  align-items: flex-start;
  font-size: 0.98rem;
  color: var(--text);
}

.pull-list li::before {
  content: "";
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: var(--nude-deep);
  margin-top: 8px;
  flex-shrink: 0;
}

.persona-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 22px;
  margin-top: 20px;
}

.persona-card {
  background: var(--paper-raised);
  border-radius: var(--radius-lg);
  padding: 30px 26px;
  border: 1px solid var(--line);
  transition: transform 0.4s ease, box-shadow 0.4s ease, border-color 0.4s ease;
}

.persona-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 30px 50px -26px rgba(65, 46, 206, 0.18);
  border-color: rgba(65, 46, 206, 0.28);
}

.persona-tag {
  font-family: var(--font-mono), monospace;
  font-size: 0.7rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--purple);
  display: block;
  margin-bottom: 12px;
}

.persona-card h3 {
  font-size: 1.35rem;
  margin-bottom: 10px;
}

.persona-card p {
  color: var(--text-soft);
  font-size: 0.95rem;
  margin: 0;
}

.values-row {
  display: flex;
  flex-wrap: wrap;
  gap: 14px;
  margin-top: 34px;
}

.value-pill {
  font-family: var(--font-mono), monospace;
  font-size: 0.8rem;
  letter-spacing: 0.04em;
  border: 1px dashed rgba(65, 46, 206, 0.35);
  color: var(--purple);
  padding: 10px 18px;
  border-radius: 100px;
}

/* Services */
.service-list {
  display: grid;
  gap: 1px;
  background: var(--line-on-purple);
  border: 1px solid var(--line-on-purple);
  border-radius: var(--radius-lg);
  overflow: hidden;
}

.service-row {
  background: var(--panel-on-purple);
  display: grid;
  grid-template-columns: 70px 1.3fr 1.7fr auto;
  gap: 28px;
  align-items: center;
  padding: 30px clamp(20px, 3vw, 36px);
  transition: background 0.3s ease;
}

.service-row:hover {
  background: rgba(255, 255, 255, 0.12);
}

.service-index {
  font-family: var(--font-mono), monospace;
  color: var(--text-on-purple-soft);
  opacity: 0.7;
  font-size: 0.95rem;
}

.service-row h3 {
  font-size: 1.3rem;
}

.service-row p {
  color: var(--text-on-purple-soft);
  margin: 0;
  font-size: 0.96rem;
}

.service-cta {
  font-family: var(--font-mono), monospace;
  font-size: 0.82rem;
  color: var(--nude);
  white-space: nowrap;
  display: inline-flex;
  align-items: center;
  gap: 6px;
  transition: gap 0.3s ease, color 0.3s ease;
}

.service-row:hover .service-cta {
  gap: 10px;
  color: #fff;
}

.program-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 26px;
  margin-top: 60px;
}

.program-card {
  background: var(--panel-on-purple);
  border: 1px solid var(--line-on-purple);
  border-radius: var(--radius-lg);
  padding: 36px;
}

.program-card h3 {
  font-size: 1.5rem;
  margin-bottom: 14px;
  color: #fff;
}

.program-card p {
  color: var(--text-on-purple-soft);
  margin-bottom: 22px;
}

/* Impact */
.impact-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1px;
  background: var(--line);
  border: 1px solid var(--line);
  border-radius: var(--radius-lg);
  overflow: hidden;
}

.impact-cell {
  background: var(--paper-raised);
  padding: 34px 26px;
}

.impact-cell .num {
  font-family: var(--font-mono), monospace;
  font-size: clamp(2.1rem, 3.4vw, 2.6rem);
  color: var(--purple);
  font-weight: 600;
  display: flex;
  align-items: baseline;
  gap: 4px;
}

.impact-cell .label {
  font-size: 0.92rem;
  color: var(--text-soft);
  margin-top: 8px;
}

/* Testimonials */
.testi-track-wrap {
  position: relative;
}

.testi-track {
  display: flex;
  gap: 22px;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  padding-bottom: 10px;
  scrollbar-width: thin;
  scrollbar-color: var(--purple) transparent;
}

.testi-card {
  scroll-snap-align: start;
  flex: 0 0 min(380px, 84vw);
  background: var(--paper-raised);
  border: 1px solid var(--line);
  border-radius: var(--radius-lg);
  padding: 32px;
  display: flex;
  flex-direction: column;
}

.testi-stars {
  color: var(--nude-deep);
  letter-spacing: 2px;
  margin-bottom: 16px;
  font-size: 0.9rem;
}

.testi-quote {
  font-family: var(--font-display), serif;
  font-size: 1.08rem;
  line-height: 1.5;
  flex-grow: 1;
  margin-bottom: 22px;
}

.testi-name {
  display: flex;
  align-items: center;
  gap: 12px;
  font-family: var(--font-mono), monospace;
  font-size: 0.82rem;
  color: var(--text-soft);
}

.testi-avatar {
  width: 38px;
  height: 38px;
  border-radius: 50%;
  background: linear-gradient(145deg, var(--purple), var(--purple-bright));
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 700;
  flex-shrink: 0;
}

.testi-controls {
  display: flex;
  gap: 10px;
  margin-top: 24px;
  justify-content: flex-end;
}

.testi-controls button {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  border: 1px solid var(--line);
  background: var(--paper-raised);
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background 0.25s ease, border-color 0.25s ease, color 0.25s ease;
}

.testi-controls button:hover {
  background: var(--purple);
  border-color: var(--purple);
  color: #fff;
}

/* Resources */
.resource-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 24px;
}

.resource-card {
  border-radius: var(--radius-lg);
  padding: 36px;
  border: 1px solid var(--line);
  background: var(--paper-raised);
  display: flex;
  flex-direction: column;
  gap: 18px;
  transition: transform 0.4s ease, box-shadow 0.4s ease;
}

.resource-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 30px 60px -30px rgba(65, 46, 206, 0.2);
}

.resource-icon {
  width: 52px;
  height: 52px;
  border-radius: 14px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--purple-soft);
  color: var(--purple);
}

.resource-card h3 {
  font-size: 1.4rem;
}

.resource-card p {
  color: var(--text-soft);
  margin: 0;
  flex-grow: 1;
}

/* FAQ */
.faq-list {
  display: grid;
  gap: 1px;
  background: var(--line);
  border: 1px solid var(--line);
  border-radius: var(--radius-lg);
  overflow: hidden;
}

.faq-item {
  background: var(--paper-raised);
}

.faq-item summary {
  list-style: none;
  cursor: pointer;
  padding: 24px clamp(20px, 3vw, 32px);
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 20px;
  font-family: var(--font-display), serif;
  font-size: 1.08rem;
  font-weight: 600;
}

.faq-item summary::-webkit-details-marker {
  display: none;
}

.faq-icon {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  border: 1px solid var(--line);
  flex-shrink: 0;
  position: relative;
}

.faq-icon::before,
.faq-icon::after {
  content: "";
  position: absolute;
  background: var(--purple);
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.faq-icon::before {
  width: 12px;
  height: 2px;
}

.faq-icon::after {
  width: 2px;
  height: 12px;
  transition: transform 0.3s ease, opacity 0.3s ease;
}

.faq-item[open] .faq-icon::after {
  transform: translate(-50%, -50%) rotate(90deg);
  opacity: 0;
}

.faq-answer {
  padding: 0 clamp(20px, 3vw, 32px) 26px;
  color: var(--text-soft);
  max-width: 68ch;
}

/* CTA banner */
.cta-banner {
  border-radius: var(--radius-lg);
  padding: clamp(40px, 6vw, 64px);
  background: linear-gradient(135deg, var(--purple) 0%, var(--purple-deep) 100%);
  color: #fff;
  display: grid;
  grid-template-columns: 1.3fr auto;
  align-items: center;
  gap: 30px;
}

.cta-banner h2 {
  color: #fff;
  font-size: clamp(1.7rem, 3vw, 2.4rem);
}

.cta-banner p {
  color: rgba(255, 255, 255, 0.85);
  margin-top: 10px;
  max-width: 52ch;
}

.cta-actions {
  display: flex;
  gap: 14px;
  flex-wrap: wrap;
}

/* Contact */
.contact-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: clamp(30px, 5vw, 70px);
  margin-top: 56px;
  align-items: start;
}

.contact-card {
  background: var(--panel-on-purple);
  border: 1px solid var(--line-on-purple);
  border-radius: var(--radius-lg);
  padding: 34px;
}

.contact-row {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 18px 0;
  border-bottom: 1px dashed var(--line-on-purple);
}

.contact-row:last-child {
  border-bottom: none;
}

.contact-row .icon {
  width: 44px;
  height: 44px;
  border-radius: 12px;
  background: rgba(255, 255, 255, 0.12);
  color: var(--nude);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.contact-row a,
.contact-row .val {
  font-family: var(--font-mono), monospace;
  font-size: 0.95rem;
  color: #fff;
}

.contact-row .label {
  display: block;
  font-size: 0.78rem;
  color: var(--text-on-purple-soft);
  margin-bottom: 2px;
}

.form-field {
  margin-bottom: 18px;
}

.form-field label {
  display: block;
  font-family: var(--font-mono), monospace;
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  color: var(--text-on-purple-soft);
  margin-bottom: 8px;
}

.form-field input,
.form-field textarea {
  width: 100%;
  background: rgba(255, 255, 255, 0.08);
  border: 1px solid var(--line-on-purple);
  border-radius: var(--radius-sm);
  padding: 13px 16px;
  color: #fff;
  font-family: var(--font-body), sans-serif;
  font-size: 0.95rem;
}

.form-field textarea {
  min-height: 110px;
  resize: vertical;
}

.form-field input:focus,
.form-field textarea:focus {
  border-color: var(--nude);
  outline: none;
}

.form-note {
  font-size: 0.82rem;
  color: var(--text-on-purple-soft);
  margin-top: 12px;
}

/* Footer */
.site-footer {
  background: var(--purple-deep);
  color: var(--text-on-purple-soft);
  padding-top: 70px;
}

.footer-grid {
  display: grid;
  grid-template-columns: 1.4fr 1fr 1fr 1fr;
  gap: 40px;
  padding-bottom: 50px;
  border-bottom: 1px solid var(--line-on-purple);
}

.footer-brand p {
  max-width: 34ch;
  margin-top: 14px;
  font-size: 0.92rem;
}

.footer-col h4 {
  font-family: var(--font-mono), monospace;
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: #fff;
  margin-bottom: 18px;
  font-weight: 500;
}

.footer-col ul {
  display: grid;
  gap: 12px;
}

.footer-col a {
  font-size: 0.92rem;
  transition: color 0.25s ease;
}

.footer-col a:hover {
  color: var(--nude);
}

.footer-social {
  display: flex;
  gap: 12px;
  margin-top: 18px;
}

.footer-social a {
  width: 38px;
  height: 38px;
  border-radius: 50%;
  border: 1px solid var(--line-on-purple);
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background 0.25s ease, border-color 0.25s ease;
}

.footer-social a:hover {
  background: var(--nude);
  border-color: var(--nude);
  color: var(--text);
}

.footer-bottom {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 26px 0;
  font-size: 0.82rem;
  flex-wrap: wrap;
  gap: 10px;
}

/* Responsive */
@media (max-width: 980px) {
  .hero-grid {
    grid-template-columns: 1fr;
  }
  .hero-visual {
    order: -1;
    max-width: 420px;
    margin-inline: auto;
  }
  .about-grid {
    grid-template-columns: 1fr;
  }
  .persona-grid {
    grid-template-columns: 1fr;
  }
  .impact-grid {
    grid-template-columns: repeat(2, 1fr);
  }
  .program-grid {
    grid-template-columns: 1fr;
  }
  .resource-grid {
    grid-template-columns: 1fr;
  }
  .contact-grid {
    grid-template-columns: 1fr;
  }
  .service-row {
    grid-template-columns: 1fr;
    gap: 10px;
  }
  .service-index {
    display: none;
  }
  .cta-banner {
    grid-template-columns: 1fr;
    text-align: left;
  }
  .footer-grid {
    grid-template-columns: 1fr 1fr;
  }
}

@media (max-width: 720px) {
  .nav-links {
    position: fixed;
    inset: 68px 16px auto 16px;
    background: var(--purple-deep);
    border: 1px solid var(--line-on-purple);
    border-radius: var(--radius-md);
    flex-direction: column;
    align-items: flex-start;
    padding: 18px 20px;
    gap: 4px;
    transform-origin: top;
    transform: scaleY(0);
    opacity: 0;
    transition: transform 0.3s ease, opacity 0.3s ease;
    pointer-events: none;
  }
  .nav-links a {
    padding: 10px 0;
    width: 100%;
  }
  .nav-links.is-open {
    transform: scaleY(1);
    opacity: 1;
    pointer-events: auto;
  }
  .nav-toggle {
    display: flex;
  }
  .nav-cta .btn-ghost-dark {
    display: none;
  }
  .impact-grid {
    grid-template-columns: 1fr;
  }
  .footer-grid {
    grid-template-columns: 1fr 1fr;
    gap: 30px;
  }
}
EOF

cat > app/layout.tsx << 'EOF'
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
    'Triift Africa helps nano and micro business owners across Africa access business registration, training, mentorship, resources and a thriving entrepreneur community.',
  keywords: [
    'business community Africa',
    'business registration CAC',
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
      'Community, training, business registration and resources for nano and micro business owners across Africa.',
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
};

const organizationSchema = {
  '@context': 'https://schema.org',
  '@type': 'Organization',
  name: 'Triift Africa',
  url: siteUrl,
  logo: `${siteUrl}/logo-purple.png`,
  description:
    'Triift Africa supports nano and micro business owners across Africa through community, training, mentorship, business registration and practical resources.',
  email: 'triiftafrica@gmail.com',
  telephone: '+2349035333965',
  areaServed: 'Africa',
  sameAs: ['https://medium.com/@triiftafrica', 'https://selar.com/m/TriiftAfrica'],
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
        text: 'We help nano and micro business owners grow through community, training and mentorship, business registration support, and practical resources, without requiring any funding or financial product.',
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
EOF

cat > app/page.tsx << 'EOF'
import Header from '@/components/Header';
import Hero from '@/components/Hero';
import TrustStrip from '@/components/TrustStrip';
import WeaveDivider from '@/components/WeaveDivider';
import About from '@/components/About';
import Services from '@/components/Services';
import Impact from '@/components/Impact';
import Testimonials from '@/components/Testimonials';
import CtaBanner from '@/components/CtaBanner';
import Resources from '@/components/Resources';
import Faq from '@/components/Faq';
import Contact from '@/components/Contact';
import Footer from '@/components/Footer';

export default function Home() {
  return (
    <>
      <Header />
      <Hero />
      <WeaveDivider />
      <TrustStrip />
      <About />
      <Services />
      <Impact />
      <Testimonials />
      <CtaBanner />
      <Resources />
      <Faq />
      <Contact />
      <Footer />
    </>
  );
}
EOF

cat > app/sitemap.ts << 'EOF'
import type { MetadataRoute } from 'next';

export default function sitemap(): MetadataRoute.Sitemap {
  return [
    {
      url: 'https://triiftafrica.com',
      lastModified: new Date(),
      changeFrequency: 'weekly',
      priority: 1,
    },
  ];
}
EOF

cat > app/robots.ts << 'EOF'
import type { MetadataRoute } from 'next';

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: '*',
      allow: '/',
    },
    sitemap: 'https://triiftafrica.com/sitemap.xml',
  };
}
EOF

cat > components/Reveal.tsx << 'EOF'
'use client';

import { motion } from 'framer-motion';
import type { ReactNode } from 'react';

type RevealProps = {
  children: ReactNode;
  delay?: number;
  className?: string;
};

export default function Reveal({ children, delay = 0, className }: RevealProps) {
  return (
    <motion.div
      className={className}
      initial={{ opacity: 0, y: 28 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true, amount: 0.2 }}
      transition={{ duration: 0.7, delay, ease: [0.16, 0.84, 0.44, 1] }}
    >
      {children}
    </motion.div>
  );
}
EOF

cat > components/Counter.tsx << 'EOF'
'use client';

import { useEffect, useRef, useState } from 'react';
import { useInView } from 'framer-motion';

type CounterProps = {
  target: number;
  prefix?: string;
  suffix?: string;
};

export default function Counter({ target, prefix = '', suffix = '' }: CounterProps) {
  const ref = useRef<HTMLSpanElement>(null);
  const inView = useInView(ref, { once: true, amount: 0.5 });
  const [value, setValue] = useState(0);

  useEffect(() => {
    if (!inView) return;
    const duration = 1400;
    let start: number | null = null;
    let raf = 0;

    function step(timestamp: number) {
      if (start === null) start = timestamp;
      const progress = Math.min((timestamp - start) / duration, 1);
      const eased = 1 - Math.pow(1 - progress, 3);
      setValue(Math.floor(eased * target));
      if (progress < 1) {
        raf = requestAnimationFrame(step);
      } else {
        setValue(target);
      }
    }

    raf = requestAnimationFrame(step);
    return () => cancelAnimationFrame(raf);
  }, [inView, target]);

  return (
    <span ref={ref}>
      {prefix}
      {value.toLocaleString()}
      {suffix}
    </span>
  );
}
EOF

cat > components/WeaveDivider.tsx << 'EOF'
export default function WeaveDivider() {
  return <div className="section-divider" aria-hidden="true" />;
}
EOF

cat > components/Header.tsx << 'EOF'
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
          <a href="#community" className="btn btn-primary btn-sm">Join community</a>
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
EOF

cat > components/Hero.tsx << 'EOF'
import Reveal from './Reveal';
import Counter from './Counter';

export default function Hero() {
  return (
    <section className="hero" id="home">
      <div className="container hero-grid">
        <Reveal>
          <div>
            <span className="eyebrow">Nano and micro business growth, 6 countries and counting</span>
            <h1>
              Driving the growth of <em>African businesses</em>
            </h1>
            <p className="hero-lede">
              We make it easy for small business owners in Africa to access the community support
              and resources to go from struggling to thriving.
            </p>
            <div className="hero-ctas">
              <a href="#community" className="btn btn-primary">Join our business community</a>
              <a href="#resources" className="btn btn-ghost-dark">Get resources</a>
            </div>
            <blockquote className="hero-quote">
              Every business we support is proof that the right structure and community change outcomes.
              <cite>Triift Africa, on why we exist</cite>
            </blockquote>
          </div>
        </Reveal>

        <Reveal delay={0.15}>
          <div className="hero-visual">
            <div className="snapshot-card">
              <div className="snapshot-title">
                <span>Triift Snapshot</span>
                <span>2026</span>
              </div>
              <div className="snapshot-row">
                <span>Business owners trained</span>
                <span className="num"><Counter target={7000} suffix="+" /></span>
              </div>
              <div className="snapshot-row">
                <span>Student entrepreneurs trained</span>
                <span className="num"><Counter target={600} suffix="+" /></span>
              </div>
              <div className="snapshot-row">
                <span>Countries impacted</span>
                <span className="num"><Counter target={6} /></span>
              </div>
              <div className="snapshot-row">
                <span>START cohorts hosted</span>
                <span className="num"><Counter target={3} /></span>
              </div>
            </div>
            <div className="stamp" aria-hidden="true">
              <svg width="22" height="22" viewBox="0 0 24 24" fill="none">
                <path d="M5 19L19 5M9 5h10v10" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" />
              </svg>
              growing together
            </div>
            <div className="float-chip">
              <strong><Counter target={7000} suffix="+" /></strong>
              businesses grown
            </div>
          </div>
        </Reveal>
      </div>
    </section>
  );
}
EOF

cat > components/TrustStrip.tsx << 'EOF'
export default function TrustStrip() {
  const partners = ['British Council', 'She Leads Africa', 'iSafe Consulting'];

  return (
    <div className="trust-strip">
      <div className="container">
        <span className="trust-label">Trusted by, partnered with</span>
        <div className="trust-logos">
          {partners.map((name) => (
            <span key={name}>{name}</span>
          ))}
        </div>
      </div>
    </div>
  );
}
EOF

cat > components/About.tsx << 'EOF'
import Reveal from './Reveal';

const PULL_POINTS = [
  'A community built for accountability, support and growth',
  'CAC compliant business registration, done for you',
  'Templates, checklists and ebooks that solve real problems',
  'Training and mentorship from partners across Africa',
];

const VALUES = ['Community', 'Collaboration', 'Learning'];

const PERSONAS = [
  {
    tag: '01. Sabi',
    title: 'The market trader',
    body: 'Running her small business with determination, often without access to formal banking, looking for practical ways to grow her trade.',
  },
  {
    tag: '02. Savvy',
    title: 'The online vendor',
    body: 'Knows her way around social media, manages her money through a bank, and wants smart strategies to expand her business.',
  },
  {
    tag: '03. Start',
    title: 'The student entrepreneur',
    body: 'Eager to stop depending on allowance from home, turn ideas into real businesses, and build a future on her own terms.',
  },
];

export default function About() {
  return (
    <section className="section-pad section-light" id="about">
      <div className="container">
        <Reveal className="section-head">
          <span className="eyebrow">About Triift Africa</span>
          <h2>
            Grow your business. Join a community.
            <br />
            Build something that lasts.
          </h2>
        </Reveal>

        <div className="about-grid">
          <Reveal>
            <div>
              <ul className="pull-list">
                {PULL_POINTS.map((point) => (
                  <li key={point}>{point}</li>
                ))}
              </ul>
              <div className="values-row">
                {VALUES.map((value) => (
                  <span className="value-pill" key={value}>{value}</span>
                ))}
              </div>
            </div>
          </Reveal>

          <Reveal delay={0.1} className="about-copy">
            <p>
              At Triift Africa, we understand the struggle of building a business in Africa,
              especially without the right structure, mentorship, and community around you. Our
              goal is to help nano and micro business owners making less than 5 million naira
              yearly to access the community support and resources they need to grow.
            </p>
            <p>
              We started with a simple idea: ambitious business owners needed more than good
              intentions, they needed structure, accountability, and the right resources to grow.
              So we built Triift Africa around training, mentorship, business registration support,
              and a community that holds business owners accountable to their goals.
            </p>
            <p>Today, we support everyday entrepreneurs at every stage of their journey.</p>
          </Reveal>
        </div>

        <div className="persona-grid">
          {PERSONAS.map((persona, index) => (
            <Reveal delay={index * 0.1} key={persona.tag}>
              <div className="persona-card">
                <span className="persona-tag">{persona.tag}</span>
                <h3>{persona.title}</h3>
                <p>{persona.body}</p>
              </div>
            </Reveal>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF

cat > components/Services.tsx << 'EOF'
import Reveal from './Reveal';

const SERVICES = [
  {
    index: '01',
    title: 'Business community',
    body: 'A free and paid community of ambitious business owners, support, webinars, challenges, resources and opportunities to grow together.',
    cta: 'Join the community',
    href: '#community',
  },
  {
    index: '02',
    title: 'Business registration',
    body: 'Business name, limited liability and NGO registration, helping small and nano businesses become CAC compliant and formal.',
    cta: 'Register your business',
    href: '#contact',
  },
  {
    index: '03',
    title: 'Business resources',
    body: 'Templates, checklists and ebooks on pricing, marketing, and financial management, built to solve real business pain points.',
    cta: 'Get a resource',
    href: '#resources',
  },
  {
    index: '04',
    title: 'Training and mentorship',
    body: 'We partner with organizations to train, mentor and support business owners in key skills: marketing, pricing, pitching and more.',
    cta: 'Learn more',
    href: '#contact',
  },
];

export default function Services() {
  return (
    <section className="section-pad section-purple" id="services">
      <div className="container">
        <Reveal className="section-head">
          <span className="eyebrow">What we do</span>
          <h2>
            Everything you need to <em>grow on purpose</em>
          </h2>
          <p>The range of services we provide to equip African business owners to grow.</p>
        </Reveal>

        <Reveal className="service-list">
          {SERVICES.map((service) => (
            <div className="service-row" key={service.index}>
              <span className="service-index">{service.index}</span>
              <h3>{service.title}</h3>
              <p>{service.body}</p>
              <a href={service.href} className="service-cta">{service.cta} →</a>
            </div>
          ))}
        </Reveal>

        <div className="program-grid">
          <Reveal>
            <div className="program-card">
              <span className="eyebrow">Flagship program</span>
              <h3>START Accelerator Program</h3>
              <p>
                Our yearly program for student entrepreneurs and recent graduates, equipping them
                with the knowledge, skills, and resources to grow successful businesses and gradually
                close the unemployment gap in Africa.
              </p>
              <a href="#contact" className="btn btn-ghost-dark btn-sm">Join the waitlist</a>
            </div>
          </Reveal>
          <Reveal delay={0.1}>
            <div className="program-card">
              <span className="eyebrow">For partners</span>
              <h3>Program design and advisory</h3>
              <p>
                We work with development organizations, NGOs and government bodies to design and
                scale MSME support at the ecosystem level across Africa.
              </p>
              <a href="mailto:triiftafrica@gmail.com" className="btn btn-ghost-dark btn-sm">Partner with us</a>
            </div>
          </Reveal>
        </div>
      </div>
    </section>
  );
}
EOF

cat > components/Impact.tsx << 'EOF'
import Reveal from './Reveal';
import Counter from './Counter';

const STATS = [
  { target: 7000, suffix: '+', label: 'Growing business owners trained' },
  { target: 3, suffix: '', label: 'Cohorts of the START Accelerator Program' },
  { target: 600, suffix: '+', label: 'Student entrepreneurs trained across Africa' },
  { target: 6, suffix: '', label: 'African countries impacted' },
  { target: 3, suffix: '', label: 'Key partners: British Council, She Leads Africa, iSafe' },
];

export default function Impact() {
  return (
    <section className="section-pad section-tint" id="impact">
      <div className="container">
        <Reveal className="section-head">
          <span className="eyebrow">Our impact so far</span>
          <h2>Numbers we are proud of, growth we are still chasing</h2>
        </Reveal>

        <Reveal className="impact-grid">
          {STATS.map((stat, index) => (
            <div className="impact-cell" key={`${stat.label}-${index}`}>
              <div className="num">
                <Counter target={stat.target} suffix={stat.suffix} />
              </div>
              <div className="label">{stat.label}</div>
            </div>
          ))}
        </Reveal>
      </div>
    </section>
  );
}
EOF

cat > components/Testimonials.tsx << 'EOF'
'use client';

import { useRef } from 'react';
import Reveal from './Reveal';

const TESTIMONIALS = [
  {
    quote:
      'Through the visibility challenge in the Savvy Business Community, more people got to know my brand. I got more views, engagement, and could finally educate my audience.',
    name: 'Majekodunmi Adesola',
    initial: 'M',
  },
  {
    quote:
      'All thanks to this wonderful group, I was able to get a customer from the community, and I am still hoping for more.',
    name: 'Adire by Gzee',
    initial: 'A',
  },
  {
    quote:
      'I learned how to market and put it into practice, which led me to 4 potential big clients. I also know how to pitch my business now.',
    name: 'Clinton Okeowo',
    initial: 'C',
  },
  {
    quote:
      'I found the courage to market my products on Facebook aggressively and strategically. I still go back to my notes from the marketing class.',
    name: 'Rhishasan Dokong',
    initial: 'R',
  },
];

export default function Testimonials() {
  const trackRef = useRef<HTMLDivElement>(null);

  function scrollByCard(direction: 1 | -1) {
    const track = trackRef.current;
    if (!track) return;
    const card = track.querySelector('.testi-card');
    const width = card ? card.getBoundingClientRect().width + 22 : 320;
    track.scrollBy({ left: direction * width, behavior: 'smooth' });
  }

  return (
    <section className="section-pad section-light" id="community">
      <div className="container">
        <Reveal className="section-head">
          <span className="eyebrow">In their words</span>
          <h2>
            Real businesses, <em>real growth</em>
          </h2>
          <p>Stories from the entrepreneurs building alongside us.</p>
        </Reveal>

        <Reveal className="testi-track-wrap">
          <div>
            <div className="testi-track" ref={trackRef}>
              {TESTIMONIALS.map((item) => (
                <article className="testi-card" key={item.name}>
                  <div className="testi-stars">★★★★★</div>
                  <p className="testi-quote">{item.quote}</p>
                  <div className="testi-name">
                    <span className="testi-avatar">{item.initial}</span>
                    {item.name}
                  </div>
                </article>
              ))}
            </div>
            <div className="testi-controls">
              <button type="button" aria-label="Previous testimonial" onClick={() => scrollByCard(-1)}>
                <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                  <path d="M10 3L5 8L10 13" stroke="currentColor" strokeWidth="1.5" />
                </svg>
              </button>
              <button type="button" aria-label="Next testimonial" onClick={() => scrollByCard(1)}>
                <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                  <path d="M6 3L11 8L6 13" stroke="currentColor" strokeWidth="1.5" />
                </svg>
              </button>
            </div>
          </div>
        </Reveal>
      </div>
    </section>
  );
}
EOF

cat > components/CtaBanner.tsx << 'EOF'
import Reveal from './Reveal';

export default function CtaBanner() {
  return (
    <section className="section-light" style={{ paddingTop: 0 }}>
      <div className="container">
        <Reveal className="cta-banner">
          <div>
            <span className="eyebrow" style={{ color: 'var(--orchid)' }}>Join the movement</span>
            <h2>You are building your business. You should not have to do it alone.</h2>
            <p>
              Get access to funding, mentorship and a community of business owners across Africa
              who show up for each other.
            </p>
          </div>
          <div className="cta-actions">
            <a href="#contact" className="btn btn-primary">Join our community</a>
          </div>
        </Reveal>
      </div>
    </section>
  );
}
EOF

cat > components/Resources.tsx << 'EOF'
import Reveal from './Reveal';

export default function Resources() {
  return (
    <section className="section-light" id="resources" style={{ paddingTop: 0, paddingBottom: 'var(--space-section)' }}>
      <div className="container">
        <Reveal className="section-head">
          <span className="eyebrow">Blogs and resources</span>
          <h2>Learn while you build</h2>
          <p>Practical writing and downloadable tools for African business owners.</p>
        </Reveal>

        <div className="resource-grid">
          <Reveal>
            <a href="https://medium.com/@triiftafrica" target="_blank" rel="noopener noreferrer" className="resource-card">
              <div className="resource-icon">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none">
                  <path d="M4 5v14M12 5v14M20 5v14M4 12h8M4 8h16M4 16h16" stroke="currentColor" strokeWidth="1.4" />
                </svg>
              </div>
              <h3>Read our Medium</h3>
              <p>Stories, lessons and insights on funding, marketing and running a small business in Africa.</p>
              <span className="service-cta">Visit Medium →</span>
            </a>
          </Reveal>

          <Reveal delay={0.1}>
            <a href="https://selar.com/m/TriiftAfrica" target="_blank" rel="noopener noreferrer" className="resource-card">
              <div className="resource-icon">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none">
                  <path d="M4 4h16v4H4zM6 8v12h12V8" stroke="currentColor" strokeWidth="1.4" />
                </svg>
              </div>
              <h3>Browse resources on Selar</h3>
              <p>Templates, checklists and ebooks that solve real business pain points: pricing, sales tracking, content and more.</p>
              <span className="service-cta">Visit Selar →</span>
            </a>
          </Reveal>
        </div>
      </div>
    </section>
  );
}
EOF

cat > components/Faq.tsx << 'EOF'
import Reveal from './Reveal';

const FAQS = [
  {
    q: 'What does Triift Africa help with?',
    a: 'We help nano and micro business owners grow through community, training and mentorship, business registration support, and practical resources, without requiring any funding or financial product.',
  },
  {
    q: 'What is the Triift Community?',
    a: 'A network of entrepreneurs, mentors, and growth partners working together to build successful African businesses. Members get access to training, opportunities, and exclusive resources, with a paid tier for additional support.',
  },
  {
    q: 'How can I join the community?',
    a: 'Sign up through our website. Once you register, you will receive the link to join our WhatsApp community and get updates on programs and events.',
  },
  {
    q: 'How do I get my business registered?',
    a: 'Reach out through our contact form or email, and our team will guide you through CAC registration, including business name, limited liability, or NGO registration.',
  },
  {
    q: 'Is Triift Africa only for Nigerians?',
    a: 'Not at all. While many of our programs started in Nigeria, we are expanding across Africa, with members in Ghana, Malawi, and beyond.',
  },
  {
    q: 'I am an organization interested in partnering with Triift. How can I get involved?',
    a: 'We collaborate with corporate brands, NGOs, development agencies, and government bodies that want to support small businesses. Email us at triiftafrica@gmail.com to get started.',
  },
];

export default function Faq() {
  return (
    <section className="section-tint" id="faqs" style={{ paddingTop: 0, paddingBottom: 'var(--space-section)' }}>
      <div className="container">
        <Reveal className="section-head">
          <span className="eyebrow">Frequently asked questions</span>
          <h2>Everything you might want to know</h2>
        </Reveal>

        <Reveal className="faq-list">
          {FAQS.map((item) => (
            <details className="faq-item" key={item.q}>
              <summary>
                {item.q}
                <span className="faq-icon" aria-hidden="true" />
              </summary>
              <div className="faq-answer">{item.a}</div>
            </details>
          ))}
        </Reveal>
      </div>
    </section>
  );
}
EOF

cat > components/Contact.tsx << 'EOF'
'use client';

import { useState, type FormEvent } from 'react';
import Reveal from './Reveal';

export default function Contact() {
  const [status, setStatus] = useState<'idle' | 'sent'>('idle');

  function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setStatus('sent');
    const form = event.currentTarget;
    setTimeout(() => {
      setStatus('idle');
      form.reset();
    }, 2600);
  }

  return (
    <section className="section-pad section-purple" id="contact">
      <div className="container">
        <Reveal className="section-head">
          <span className="eyebrow">Contact us</span>
          <h2>
            Let us talk about <em>your growth</em>
          </h2>
          <p>Have a question, a partnership idea, or ready to apply? Reach out, we reply fast.</p>
        </Reveal>

        <div className="contact-grid">
          <Reveal>
            <form onSubmit={handleSubmit}>
              <div className="form-field">
                <label htmlFor="cf-name">Full name</label>
                <input id="cf-name" type="text" placeholder="Your name" required />
              </div>
              <div className="form-field">
                <label htmlFor="cf-email">Email address</label>
                <input id="cf-email" type="email" placeholder="you@example.com" required />
              </div>
              <div className="form-field">
                <label htmlFor="cf-message">Message</label>
                <textarea id="cf-message" placeholder="Tell us about your business and how we can help" required />
              </div>
              <button className="btn btn-primary" type="submit" disabled={status === 'sent'}>
                {status === 'sent' ? 'Message sent' : 'Send message'}
              </button>
              <p className="form-note">This form is a template, connect it to your email service or CRM before launch.</p>
            </form>
          </Reveal>

          <Reveal delay={0.1}>
            <div className="contact-card">
              <div className="contact-row">
                <span className="icon" aria-hidden="true">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none">
                    <path d="M3 5h18v14H3zM3 6l9 7 9-7" stroke="currentColor" strokeWidth="1.4" />
                  </svg>
                </span>
                <div>
                  <span className="label">Email</span>
                  <a href="mailto:triiftafrica@gmail.com">triiftafrica@gmail.com</a>
                </div>
              </div>
              <div className="contact-row">
                <span className="icon" aria-hidden="true">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none">
                    <path
                      d="M4 4h4l2 5-2.5 1.5a12 12 0 006 6L15 14l5 2v4a2 2 0 01-2 2C9.5 22 2 14.5 2 6a2 2 0 012-2z"
                      stroke="currentColor"
                      strokeWidth="1.3"
                    />
                  </svg>
                </span>
                <div>
                  <span className="label">Phone</span>
                  <a href="tel:+2349035333965">0903 533 3965</a>
                </div>
              </div>
              <div className="contact-row">
                <span className="icon" aria-hidden="true">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none">
                    <circle cx="12" cy="12" r="9" stroke="currentColor" strokeWidth="1.4" />
                  </svg>
                </span>
                <div>
                  <span className="label">Where we operate</span>
                  <span className="val">Nigeria and 5 more African countries</span>
                </div>
              </div>
              <div className="contact-row">
                <span className="icon" aria-hidden="true">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none">
                    <path d="M12 3v18M3 12h18" stroke="currentColor" strokeWidth="1.4" />
                  </svg>
                </span>
                <div>
                  <span className="label">Partnerships</span>
                  <span className="val">triiftafrica@gmail.com</span>
                </div>
              </div>
            </div>
          </Reveal>
        </div>
      </div>
    </section>
  );
}
EOF

cat > components/Footer.tsx << 'EOF'
import { Mail, Phone } from 'lucide-react';

function InstagramIcon() {
  return (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <rect x="3" y="3" width="18" height="18" rx="5" stroke="currentColor" strokeWidth="1.5" />
      <circle cx="12" cy="12" r="4" stroke="currentColor" strokeWidth="1.5" />
      <circle cx="17.5" cy="6.5" r="1" fill="currentColor" />
    </svg>
  );
}

function LinkedInIcon() {
  return (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <rect x="3" y="3" width="18" height="18" rx="3" stroke="currentColor" strokeWidth="1.5" />
      <path d="M7 10v7M7 7.2v.1M11 17v-4.5c0-1.4 1-2.5 2.5-2.5s2.5 1.1 2.5 2.5V17" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
    </svg>
  );
}

function XIcon() {
  return (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <path d="M4 4l16 16M20 4L4 20" stroke="currentColor" strokeWidth="1.6" strokeLinecap="round" />
    </svg>
  );
}

export default function Footer() {
  const year = new Date().getFullYear();

  return (
    <footer className="site-footer">
      <div className="container">
        <div className="footer-grid">
          <div className="footer-brand">
            <a href="#home" className="brand">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src="/logo-white.png" alt="Triift Africa" className="brand-logo" style={{ height: 40 }} />
            </a>
            <p>Driving the growth of African businesses through community, training and resources.</p>
            <div className="footer-social">
              <a href="https://instagram.com" target="_blank" rel="noopener noreferrer" aria-label="Triift Africa on Instagram">
                <InstagramIcon />
              </a>
              <a href="https://linkedin.com" target="_blank" rel="noopener noreferrer" aria-label="Triift Africa on LinkedIn">
                <LinkedInIcon />
              </a>
              <a href="https://x.com" target="_blank" rel="noopener noreferrer" aria-label="Triift Africa on X">
                <XIcon />
              </a>
            </div>
          </div>

          <div className="footer-col">
            <h4>Explore</h4>
            <ul>
              <li><a href="#about">About us</a></li>
              <li><a href="#services">Services</a></li>
              <li><a href="#impact">Impact</a></li>
              <li><a href="#faqs">FAQs</a></li>
            </ul>
          </div>

          <div className="footer-col">
            <h4>Programs</h4>
            <ul>
              <li><a href="#services">START Accelerator</a></li>
              <li><a href="#services">Business registration</a></li>
              <li><a href="#community">Business community</a></li>
            </ul>
          </div>

          <div className="footer-col">
            <h4>Connect</h4>
            <ul>
              <li>
                <a href="mailto:triiftafrica@gmail.com" style={{ display: 'inline-flex', alignItems: 'center', gap: 8 }}>
                  <Mail size={15} /> triiftafrica@gmail.com
                </a>
              </li>
              <li>
                <a href="tel:+2349035333965" style={{ display: 'inline-flex', alignItems: 'center', gap: 8 }}>
                  <Phone size={15} /> 0903 533 3965
                </a>
              </li>
              <li><a href="https://medium.com/@triiftafrica" target="_blank" rel="noopener noreferrer">Medium</a></li>
              <li><a href="https://selar.com/m/TriiftAfrica" target="_blank" rel="noopener noreferrer">Selar</a></li>
            </ul>
          </div>
        </div>

        <div className="footer-bottom">
          <span>Copyright {year} Triift Africa. All rights reserved.</span>
          <span>Built for nano and micro business owners across Africa.</span>
        </div>
      </div>
    </footer>
  );
}
EOF
