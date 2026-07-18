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
