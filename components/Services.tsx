import Reveal from './Reveal';

const SERVICES = [
  {
    index: '01',
    title: 'Business community',
    body: 'A free and paid community of ambitious business owners, support, webinars, challenges, resources and opportunities to grow together.',
    cta: 'Join the community',
    href: 'https://docs.google.com/forms/d/e/1FAIpQLSfDVrqbojRBF49hPRM4cDkbDYJOYUhztw1yDjx4LX9ijh72Kw/alreadyresponded',
    external: true,
  },
  {
    index: '02',
    title: 'Business resources',
    body: 'Templates, checklists and ebooks on pricing, marketing, and financial management, built to solve real business pain points.',
    cta: 'Get a resource',
    href: '#resources',
    external: false,
  },
  {
    index: '03',
    title: 'Training and mentorship',
    body: 'We partner with organizations to train, mentor and support business owners in key skills: marketing, pricing, pitching and more.',
    cta: 'Learn more',
    href: '#contact',
    external: false,
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
              <a
                href={service.href}
                className="service-cta"
                {...(service.external ? { target: '_blank', rel: 'noopener noreferrer' } : {})}
              >
                {service.cta} →
              </a>
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
