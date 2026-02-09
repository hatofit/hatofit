import { type Config } from 'tailwindcss'
import plugin from 'tailwindcss/plugin'
import colors from 'tailwindcss/colors'
import defaultTheme from 'tailwindcss/defaultTheme'

export default <Partial<Config>>{
  theme: {
    extend: {
      colors: {
        primary: colors.red,
        red: colors.red,
      },
      fontFamily: {
        sans: ['Poppins', ...defaultTheme.fontFamily.sans],
      }
    },
  },
  plugins: [
    plugin(function ({ addBase, theme }) {
      // addBase({
      //   'border-main': {

      //   }
      // })
    })
  ]
}
