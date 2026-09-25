import katex from 'katex'
import 'katex/dist/katex.min.css'

type Part = { value: string; expression?: string; display?: boolean }

function parseMath(value: string): Part[] {
  const parts: Part[] = []
  const pattern = /(\$\$[\s\S]+?\$\$|\$[^$\n]+?\$)/g
  let cursor = 0
  for (const match of value.matchAll(pattern)) {
    const index = match.index ?? 0
    if (index > cursor) parts.push({ value: value.slice(cursor, index) })
    const display = match[0].startsWith('$$')
    parts.push({ value: match[0], expression: match[0].slice(display ? 2 : 1, display ? -2 : -1), display })
    cursor = index + match[0].length
  }
  if (cursor < value.length) parts.push({ value: value.slice(cursor) })
  return parts
}

export function MathContent({ value, className, inline = false }: { value: string; className?: string; inline?: boolean }) {
  const Wrapper = inline ? 'span' : 'div'
  return <Wrapper className={className}>{parseMath(value).map((part, index) => part.expression === undefined
    ? <span className="math-text" key={index}>{part.value}</span>
    : <span className={part.display ? 'math-display' : 'math-inline'} key={index} dangerouslySetInnerHTML={{ __html: katex.renderToString(part.expression, { displayMode: part.display, throwOnError: false, strict: 'ignore', trust: false }) }} />)}</Wrapper>
}

export default function MathField({ label, value, onChange, rows = 4 }: { label: string; value: string; onChange: (value: string) => void; rows?: number }) {
  return <label className="math-field">{label}<textarea rows={rows} value={value} onChange={(event) => onChange(event.target.value)} /><small>LaTeX : $...$ en ligne, $$...$$ sur une ligne séparée.</small><div className="math-preview"><span className="card-kicker">Aperçu</span><MathContent value={value || 'Le rendu apparaît ici.'} /></div></label>
}
