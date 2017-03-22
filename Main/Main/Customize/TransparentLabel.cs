using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Main
{
    public class TransparentLabel : Label
    {
        public TransparentLabel()
        {
            transparentBackColor = Color.Black;
            opacity = 50;
            BackColor = Color.Transparent;
        }
        protected override void OnPaint(PaintEventArgs e)
        {
            if (Parent != null)
            {
                using (var bitmap = new Bitmap(Parent.Width, Parent.Height))
                {
                    Parent.Controls.Cast<Control>()
                          .Where(c => Parent.Controls.GetChildIndex(c) > Parent.Controls.GetChildIndex(this))
                          .Where(c => c.Bounds.IntersectsWith(this.Bounds))
                          .OrderByDescending(c => Parent.Controls.GetChildIndex(c))
                          .ToList()
                          .ForEach(c => c.DrawToBitmap(bitmap, c.Bounds));

                    e.Graphics.DrawImage(bitmap, -Left, -Top);

                    using (var b = new SolidBrush(Color.FromArgb(this.Opacity, this.TransparentBackColor)))
                        e.Graphics.FillRectangle(b, this.ClientRectangle);

                    e.Graphics.TextRenderingHint = System.Drawing.Text.TextRenderingHint.ClearTypeGridFit;
                    TextRenderer.DrawText(e.Graphics, this.Text, this.Font, this.ClientRectangle, this.ForeColor, Color.Transparent);
                }
            }
        }

        private int opacity;

        public int Opacity
        {
            get { return opacity; }
            set
            {
                if (value >= 0 && value <= 255)
                    opacity = value;
                Invalidate();
            }
        }

        public Color transparentBackColor;
        public Color TransparentBackColor
        {
            get { return transparentBackColor; }
            set
            {
                transparentBackColor = value;
                Invalidate();
            }
        }

        [System.ComponentModel.Browsable(false)]
        public override Color BackColor
        {
            get
            {
                return Color.Transparent;
            }
            set
            {
                base.BackColor = Color.Transparent;
            }
        }

        private void InitializeComponent()
        {
            SuspendLayout();
            ResumeLayout(false);
        }
    }
}
