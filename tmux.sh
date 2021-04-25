tmux new-session \;\
  send 'cd ~/project/cas-fe' ENTER \;\
  send 'yarn start' ENTER \;\
  split-window -h \;\
  split-window -v \;\
  select-pane -t 0 \;\
  split-window -v \;\


