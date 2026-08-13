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
              Building Africa&apos;s smallest businesses into something greater, by connecting them
              with the finance, digital tools, partnerships, knowledge, community and market they
              need to unlock their next level of growth.
            </p>
            <div className="hero-ctas">
              <a href="https://docs.google.com/forms/d/e/1FAIpQLSfDVrqbojRBF49hPRM4cDkbDYJOYUhztw1yDjx4LX9ijh72Kw/alreadyresponded" target="_blank" rel="noopener noreferrer" className="btn btn-primary">Join our business community</a>
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
            <div className="hero-photo">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src="/images/hero-market-woman.jpg"
                alt="A smiling African market trader surrounded by fresh produce at her stall"
              />
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
