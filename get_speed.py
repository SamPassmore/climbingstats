from climbingstats import *
from IPython.display import display, HTML
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots

events = get_event_data('data/full_data.json', period=(2007,2019))

print(events[2022][0].name)
