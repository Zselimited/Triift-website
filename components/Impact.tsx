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
