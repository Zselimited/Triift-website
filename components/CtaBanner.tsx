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
