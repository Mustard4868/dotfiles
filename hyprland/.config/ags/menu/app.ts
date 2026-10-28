import app from "ags/gtk4/app"
import style from "./style.scss"
import Bar from "./widget/Bar"

function MenuWindow() {
  const label = "hello"

  return <button>{label}</button>
}

app.start({
  css: style,
  main() {
    app.get_monitors().map(Bar)
  },
})
