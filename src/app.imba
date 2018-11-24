tag Calculator
  def setup
    set_result 0

  def set_result(result)
    @memory = result
    @display = "0"
    @operator = null

  def calculate
    let a = parseFloat(@memory)
    let b = parseFloat(@display)
    if @operator == "+"
      set_result a + b
    else if @operator == "-"
      set_result a - b
    else if @operator == "x"
      set_result a * b
    else if @operator == "÷"
      if b == 0
        set_result 0
      else
        set_result a / b
    # Do nothing if operator is null

  def digit(d)
    return if d == "." and @display.includes(".")
    @display += d
    @display = @display.replace(/^0(?=\d)/, "")

  def op(o)
    calculate
    @memory = @display
    @operator = o
    @display = "0"

  def render
    <self.calculator>
      <div.display.memory>
        @memory
        if @operator
          " {@operator}"
      <div.display.current>
        @display
      <div.button_row>
        <div.btn.digit :click=(do digit(7))>
          "7"
        <div.btn.digit :click=(do digit(8))>
          "8"
        <div.btn.digit :click=(do digit(9))>
          "9"
        <div.btn.op :click=(do op("÷"))>
          "÷"
      <div.div.btn_row>
        <div.btn.digit :click=(do digit(4))>
          "4"
        <div.btn.digit :click=(do digit(5))>
          "5"
        <div.btn.digit :click=(do digit(6))>
          "6"
        <div.btn.op :click=(do op("x"))>
          "x️"
      <div.div.btn_row>
        <div.btn.digit :click=(do digit(1))>
          "1"
        <div.btn.digit :click=(do digit(2))>
          "2"
        <div.btn.digit :click=(do digit(3))>
          "3"
        <div.btn.op :click=(do op("-"))>
          "-"
      <div.div.btn_row>
        <div.btn.digit :click=(do digit(0))>
          "0"
        <div.btn.digit :click=(do digit("."))>
          "."
        <div.btn.op :click=(do op("+"))>
          "+"
        <div.btn.eq :click=(do calculate)>
          "="

tag App
  def render
    <self>
      <header>
        "Calculator"
      <Calculator>

Imba.mount <App>
