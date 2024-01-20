export default function Container(
  props: {
    children: React.ReactNode
    className?: string
  }
) {
  const { children, className } = props

  return (
    <div className={`max-w-screen-lg mx-auto w-full ${className}`}>
      {children}
    </div>
  )
}
