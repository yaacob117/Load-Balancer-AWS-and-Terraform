resource "aws_lb_target_group_attachment" "tg-attach1" {
  target_group_arn = aws_lb_target_group.server-tg.arn
  target_id        = aws_instance.server[0].id
  port             = 80
}
resource "aws_lb_target_group_attachment" "tg-attach2" {
  target_group_arn = aws_lb_target_group.server-tg.arn
  target_id        = aws_instance.server[1].id
  port             = 80
}
resource "aws_lb_target_group_attachment" "tg-attach3" {
  target_group_arn = aws_lb_target_group.server-tg.arn
  target_id        = aws_instance.server[2].id
  port             = 80
}
