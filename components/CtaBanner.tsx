import Reveal from './Reveal';

export default function CtaBanner() {
  return (
    <section className="section-light" style={{ paddingTop: 0 }}>
      <div className="container">
        <Reveal className="cta-banner">
          <div className="cta-banner-photo">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src="/images/cta-basket-weaver.jpg"
              alt="An artisan weaving baskets by hand in his shop"
            />
          </div>
          <div className="cta-banner-overlay" />
          <div className="cta-banner-content">
            <div>
              <span className="eyebrow" style={{ color: 'var(--lilac)' }}>Join the movement</span>
              <h2>You are building your business. You should not have to do it alone.</h2>
              <p>
                Get access to mentorship and a community of business owners across Africa
                who show up for each other.
              </p>
            </div>
            <div className="cta-actions">
              <a href="https://docs.google.com/forms/d/e/1FAIpQLSfDVrqbojRBF49hPRM4cDkbDYJOYUhztw1yDjx4LX9ijh72Kw/alreadyresponded" target="_blank" rel="noopener noreferrer" className="btn btn-primary">Join our community</a>
            </div>
          </div>
        </Reveal>
      </div>
    </section>
  );
}
