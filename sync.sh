if [[ $1 == "down" ]]; then
  rsync -avzhP --progress --delete-excluded --times mcaldasr@bluehive.circ.rochester.edu:/scratch/mcaldasr/*  .
elif [[ $1 == "up" ]]; then
  rsync -avzhP --progress --delete-excluded --times . mcaldasr@bluehive.circ.rochester.edu:/scratch/mcaldasr/*
else
  echo "Only 'up' and 'down' options are available"
fi
