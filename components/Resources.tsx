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
