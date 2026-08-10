import Reveal from './Reveal';

const PULL_POINTS = [
  'A community built for accountability, support and growth',
  'Templates, checklists and ebooks that solve real problems',
  'Training and mentorship from partners across Africa',
];

const VALUES = ['Community', 'Collaboration', 'Learning'];

const PERSONAS = [
  {
    tag: '01. Sabi',
    title: 'The market trader',
    body: 'Running her small business with determination, often without access to formal banking, looking for practical ways to grow her trade.',
    image: '/images/persona-sabi.jpg',
    alt: 'A smiling fabric shop owner displaying colourful textile prints',
    position: 'center 25%',
  },
  {
    tag: '02. Savvy',
    title: 'The online vendor',
    body: 'Knows her way around social media, manages her money through a bank, and wants smart strategies to expand her business.',
    image: '/images/persona-savvy.jpg',
    alt: 'A vendor processing a payment on a card machine at her stall',
    position: 'center 30%',
  },
  {
    tag: '03. Start',
    title: 'The student entrepreneur',
    body: 'Eager to stop depending on allowance from home, turn ideas into real businesses, and build a future on her own terms.',
    image: '/images/persona-start.jpg',
    alt: 'A young entrepreneur working with tools, building her trade',
    position: 'center 15%',
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
              So we built Triift Africa around training, mentorship, and a community that holds
              business owners accountable to their goals.
            </p>
            <p>Today, we support everyday entrepreneurs at every stage of their journey.</p>
          </Reveal>
        </div>

        <div className="persona-grid">
          {PERSONAS.map((persona, index) => (
            <Reveal delay={index * 0.1} key={persona.tag}>
              <div className="persona-card">
                <div className="persona-photo">
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img src={persona.image} alt={persona.alt} style={{ objectPosition: persona.position }} />
                </div>
                <div className="persona-card-body">
                  <span className="persona-tag">{persona.tag}</span>
                  <h3>{persona.title}</h3>
                  <p>{persona.body}</p>
                </div>
              </div>
            </Reveal>
          ))}
        </div>
      </div>
    </section>
  );
}
