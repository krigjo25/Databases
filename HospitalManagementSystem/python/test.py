from reportlab.pdfgen import canvas

def hello(c):
    c.drawString(100, 100, "Hellow Worlds")

c = canvas.Canvas('demo.pdf')
hello(c)
c.showPage()
c.save()

