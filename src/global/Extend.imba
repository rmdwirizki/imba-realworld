import { format } from 'date-fns'

extend tag element
  def timestamp date
    return format(date, 'MMM Do')
  def asset resource=''
    return window:location:pathname + 'build/' + resource
  def avatar src
    return src || 'https://static.productionready.io/images/smiley-cyrus.jpg'