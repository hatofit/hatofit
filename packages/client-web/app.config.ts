export default defineAppConfig({
  ui: {
    // strategy: '',
    primary: 'red',
    button: {
      color: {
        gray: {
          ghost: 'hover:bg-gray-200'
        }
      }
    },
    card: {
      background: 'bg-white dark:bg-gray-900',
    },
    container: {
      base: 'mx-auto',
      padding: 'px-4 py-6',
      constrained: 'max-w-screen-lg w-full',
    },
    breadcrumb: {
      li: 'text-xs leading-none',
    },
    table: {
      wrapper: 'border border-gray-500/50 rounded',
    },
  },
})
