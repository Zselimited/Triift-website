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
