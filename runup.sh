
#!/bin/sh

SOURCESDIR=./runup_source_files

echo ""
echo "RunUp..." 
echo ""

case $1 in
	install)
		echo ""
        echo "Install..."
        echo ""
        git clone https://github.com/Laradock/laradock.git
        cd laradock/
        cp env-example .env
        docker-compose up -d workspace
        docker-compose exec --user=laradock workspace composer create-project laravel/laravel $SOURCESDIR --prefer-dist
        docker-compose down
        cd ..
        chmod -R 777 $SOURCESDIR/bootstrap/cache/
        chmod -R 777 $SOURCESDIR/storage/
        cp -Rf $SOURCESDIR/* ./
        rm -Rf $SOURCESDIR/
        ;;

	reclone)
        echo ""
		echo "Re-clone gitrepo"
        echo ""
		git clone git@github.com:madeinnordeste/runup.git .
		;;

	*)
        echo ""
		echo "Sorry :( I don't understand\n"
        echo "\tuse:"
        echo "\tsh runup.sh install | reclone"
        echo ""
		;;
esac
echo ""