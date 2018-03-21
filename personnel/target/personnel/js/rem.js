 (function (doc, win, undefined) {
              var docEl = doc.documentElement;
            var  resizeEvt = 'orientationchange' in win? 'orientationchange' : 'resize';
             var  recalc = function () {
                var clientWidth = docEl.clientWidth;
               if (clientWidth === undefined) return;
                docEl.style.fontSize = 20 * (clientWidth / 1366) + 'px';
              };
            if (doc.addEventListener === undefined) return;
           win.addEventListener(resizeEvt, recalc, false);
           doc.addEventListener('DOMContentLoaded', recalc, false)
         })(document, window);