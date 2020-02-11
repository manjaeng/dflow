<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain popJoin mo">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="joinForm">
				<div class="hdt"><em>SIGN UP</em></div>
				<div class="form">
					<div class="nation">
						<select class="select" id="nation_code">

							<option value="93">Afghanistan +93</option>
							<option value="355">Albania +355</option>
							<option value="213">Algeria +213</option>
							<option value="1">American Samoa +1</option>
							<option value="376">Andorra +376</option>
							<option value="244">Angola +244</option>
							<option value="1">Anguilla +1</option>
							<option value="1">Antigua &amp; Barbuda +1</option>
							<option value="54">Argentina +54</option>
							<option value="374">Armenia +374</option>
							<option value="297">Aruba +297</option>
							<option value="247">Ascension Island +247</option>
							<option value="61">Australia +61</option>
							<option value="43">Austria +43</option>
							<option value="994">Azerbaijan +994</option>
							<option value="1">Bahamas +1</option>
							<option value="973">Bahrain +973</option>
							<option value="880">Bangladesh +880</option>
							<option value="1">Barbados +1</option>
							<option value="375">Belarus +375</option>
							<option value="32">Belgium +32</option>
							<option value="501">Belize +501</option>
							<option value="229">Benin +229</option>
							<option value="1">Bermuda +1</option>
							<option value="975">Bhutan +975</option>
							<option value="591">Bolivia +591</option>
							<option value="387">Bosnia &amp; Herzegovina +387</option>
							<option value="267">Botswana +267</option>
							<option value="55">Brazil +55</option>
							<option value="246">British Indian Ocean Territory +246</option>
							<option value="1">British Virgin Islands +1</option>
							<option value="673">Brunei +673</option>
							<option value="359">Bulgaria +359</option>
							<option value="226">Burkina Faso +226</option>
							<option value="257">Burundi +257</option>
							<option value="855">Cambodia +855</option>
							<option value="237">Cameroon +237</option>
							<option value="1">Canada +1</option>
							<option value="238">Cape Verde +238</option>
							<option value="599">Caribbean Netherlands +599</option>
							<option value="1">Cayman Islands +1</option>
							<option value="236">Central African Republic +236</option>
							<option value="235">Chad +235</option>
							<option value="56">Chile +56</option>
							<option value="86">China +86</option>
							<option value="57">Colombia +57</option>
							<option value="269">Comoros +269</option>
							<option value="242">Congo - Brazzaville +242</option>
							<option value="243">Congo - Kinshasa +243</option>
							<option value="682">Cook Islands +682</option>
							<option value="506">Costa Rica +506</option>
							<option value="225">Côte d’Ivoire +225</option>
							<option value="385">Croatia +385</option>
							<option value="53">Cuba +53</option>
							<option value="599">Curaçao +599</option>
							<option value="357">Cyprus +357</option>
							<option value="420">Czechia +420</option>
							<option value="45">Denmark +45</option>
							<option value="253">Djibouti +253</option>
							<option value="1">Dominica +1</option>
							<option value="1">Dominican Republic +1</option>
							<option value="593">Ecuador +593</option>
							<option value="20">Egypt +20</option>
							<option value="503">El Salvador +503</option>
							<option value="240">Equatorial Guinea +240</option>
							<option value="291">Eritrea +291</option>
							<option value="372">Estonia +372</option>
							<option value="268">Eswatini +268</option>
							<option value="251">Ethiopia +251</option>
							<option value="500">Falkland Islands (Islas Malvinas) +500</option>
							<option value="298">Faroe Islands +298</option>
							<option value="679">Fiji +679</option>
							<option value="358">Finland +358</option>
							<option value="33">France +33</option>
							<option value="594">French Guiana +594</option>
							<option value="689">French Polynesia +689</option>
							<option value="241">Gabon +241</option>
							<option value="220">Gambia +220</option>
							<option value="995">Georgia +995</option>
							<option value="49">Germany +49</option>
							<option value="233">Ghana +233</option>
							<option value="350">Gibraltar +350</option>
							<option value="30">Greece +30</option>
							<option value="299">Greenland +299</option>
							<option value="1">Grenada +1</option>
							<option value="590">Guadeloupe +590</option>
							<option value="1">Guam +1</option>
							<option value="502">Guatemala +502</option>
							<option value="224">Guinea +224</option>
							<option value="245">Guinea-Bissau +245</option>
							<option value="592">Guyana +592</option>
							<option value="509">Haiti +509</option>
							<option value="504">Honduras +504</option>
							<option value="852">Hong Kong +852</option>
							<option value="36">Hungary +36</option>
							<option value="354">Iceland +354</option>
							<option value="91">India +91</option>
							<option value="62">Indonesia +62</option>
							<option value="98">Iran +98</option>
							<option value="964">Iraq +964</option>
							<option value="353">Ireland +353</option>
							<option value="972">Israel +972</option>
							<option value="39">Italy +39</option>
							<option value="1">Jamaica +1</option>
							<option value="81">Japan +81</option>
							<option value="962">Jordan +962</option>
							<option value="7">Kazakhstan +7</option>
							<option value="254">Kenya +254</option>
							<option value="686">Kiribati +686</option>
							<option value="383">Kosovo +383</option>
							<option value="965">Kuwait +965</option>
							<option value="996">Kyrgyzstan +996</option>
							<option value="856">Laos +856</option>
							<option value="371">Latvia +371</option>
							<option value="961">Lebanon +961</option>
							<option value="266">Lesotho +266</option>
							<option value="231">Liberia +231</option>
							<option value="218">Libya +218</option>
							<option value="423">Liechtenstein +423</option>
							<option value="370">Lithuania +370</option>
							<option value="352">Luxembourg +352</option>
							<option value="853">Macao +853</option>
							<option value="261">Madagascar +261</option>
							<option value="265">Malawi +265</option>
							<option value="60">Malaysia +60</option>
							<option value="960">Maldives +960</option>
							<option value="223">Mali +223</option>
							<option value="356">Malta +356</option>
							<option value="692">Marshall Islands +692</option>
							<option value="596">Martinique +596</option>
							<option value="222">Mauritania +222</option>
							<option value="230">Mauritius +230</option>
							<option value="52">Mexico +52</option>
							<option value="691">Micronesia +691</option>
							<option value="373">Moldova +373</option>
							<option value="377">Monaco +377</option>
							<option value="976">Mongolia +976</option>
							<option value="382">Montenegro +382</option>
							<option value="1">Montserrat +1</option>
							<option value="212">Morocco +212</option>
							<option value="258">Mozambique +258</option>
							<option value="95">Myanmar (Burma) +95</option>
							<option value="264">Namibia +264</option>
							<option value="674">Nauru +674</option>
							<option value="977">Nepal +977</option>
							<option value="31">Netherlands +31</option>
							<option value="687">New Caledonia +687</option>
							<option value="64">New Zealand +64</option>
							<option value="505">Nicaragua +505</option>
							<option value="227">Niger +227</option>
							<option value="234">Nigeria +234</option>
							<option value="683">Niue +683</option>
							<option value="672">Norfolk Island +672</option>
							<option value="850">North Korea +850</option>
							<option value="389">North Macedonia +389</option>
							<option value="1">Northern Mariana Islands +1</option>
							<option value="47">Norway +47</option>
							<option value="968">Oman +968</option>
							<option value="92">Pakistan +92</option>
							<option value="680">Palau +680</option>
							<option value="970">Palestine +970</option>
							<option value="507">Panama +507</option>
							<option value="675">Papua New Guinea +675</option>
							<option value="595">Paraguay +595</option>
							<option value="51">Peru +51</option>
							<option value="63">Philippines +63</option>
							<option value="48">Poland +48</option>
							<option value="351">Portugal +351</option>
							<option value="1">Puerto Rico +1</option>
							<option value="974">Qatar +974</option>
							<option value="262">Réunion +262</option>
							<option value="40">Romania +40</option>
							<option value="7">Russia +7</option>
							<option value="250">Rwanda +250</option>
							<option value="685">Samoa +685</option>
							<option value="378">San Marino +378</option>
							<option value="239">São Tomé &amp; Príncipe +239</option>
							<option value="966">Saudi Arabia +966</option>
							<option value="221">Senegal +221</option>
							<option value="381">Serbia +381</option>
							<option value="248">Seychelles +248</option>
							<option value="232">Sierra Leone +232</option>
							<option value="65">Singapore +65</option>
							<option value="1">Sint Maarten +1</option>
							<option value="421">Slovakia +421</option>
							<option value="386">Slovenia +386</option>
							<option value="677">Solomon Islands +677</option>
							<option value="252">Somalia +252</option>
							<option value="27">South Africa +27</option>
							<option value="82" selected>South Korea +82</option>
							<option value="211">South Sudan +211</option>
							<option value="34">Spain +34</option>
							<option value="94">Sri Lanka +94</option>
							<option value="590">St. Barthélemy +590</option>
							<option value="290">St. Helena +290</option>
							<option value="1">St. Kitts &amp; Nevis +1</option>
							<option value="1">St. Lucia +1</option>
							<option value="590">St. Martin +590</option>
							<option value="508">St. Pierre &amp; Miquelon +508</option>
							<option value="1">St. Vincent &amp; Grenadines +1</option>
							<option value="249">Sudan +249</option>
							<option value="597">Suriname +597</option>
							<option value="46">Sweden +46</option>
							<option value="41">Switzerland +41</option>
							<option value="963">Syria +963</option>
							<option value="886">Taiwan +886</option>
							<option value="992">Tajikistan +992</option>
							<option value="255">Tanzania +255</option>
							<option value="66">Thailand +66</option>
							<option value="670">Timor-Leste +670</option>
							<option value="228">Togo +228</option>
							<option value="690">Tokelau +690</option>
							<option value="676">Tonga +676</option>
							<option value="1">Trinidad &amp; Tobago +1</option>
							<option value="216">Tunisia +216</option>
							<option value="90">Turkey +90</option>
							<option value="993">Turkmenistan +993</option>
							<option value="1">Turks &amp; Caicos Islands +1</option>
							<option value="688">Tuvalu +688</option>
							<option value="1">U.S. Virgin Islands +1</option>
							<option value="256">Uganda +256</option>
							<option value="380">Ukraine +380</option>
							<option value="971">United Arab Emirates +971</option>
							<option value="44">United Kingdom +44</option>
							<option value="1">United States +1</option>
							<option value="598">Uruguay +598</option>
							<option value="998">Uzbekistan +998</option>
							<option value="678">Vanuatu +678</option>
							<option value="39">Vatican City +39</option>
							<option value="58">Venezuela +58</option>
							<option value="84">Vietnam +84</option>
							<option value="681">Wallis &amp; Futuna +681</option>
							<option value="967">Yemen +967</option>
							<option value="260">Zambia +260</option>
							<option value="263">Zimbabwe +263</option>
						</select>
					</div>
					<div class="uiIptPlc phone">
						<input type="number" class="input" value="">
						<span class="plc">Mobile Phone</span>
						<a href="javascript:;" class="btn c sm btnSend">SEND</a>
					</div>
					
					<div class="uiIptPlc certi">
						<input type="number" class="input" value="">
						<span class="plc">Verification number </span>
						<span class="time" style="display:none;">2:59</span>
					</div>
					<div class="msgcode" style="display:none;">해당 번호로 코드를 전송하였습니다.</div>
					<div class="msg_error" id="msg_exist"></div>
					<div class="findpws" style="display:none;">
						<a href="./find_password.do" class="link">FORGOT ID/PASSWORD?</a>
					</div>
					
					<div class="agree">
						<div class="txt">
							본인이 만 14세 이상인 것과 서비스 이용약관, <br> <a href="/app/setting/police1.do">서비스이용약관</a>, <a href="/app/setting/police2.do">개인정보보호정책</a>에 동의하십니까? </div>
						<label class="checkbox"><input type="checkbox"><span></span></label>
					</div>
					<div class="msg_error" id="msg_agree">약관에 동의해 주세요.</div>

				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./join_id.do" class="btn xl b fill btnNext">NEXT</a>
					</div>
				</div>
			</div>
		</main>
	</div>
	
	<div class="popLayerArea">
		<!-- 필터 -->
<article class="popLayer a popFilter" id="popFilter">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="phd">
			<div class="hdt">
				<h1 class="title">FILTER</h1>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<ul class="filters">
					<li class="match">
						<div class="ht">MATCH</div>
						<div class="ct">
							<div class="uiSlider range">
								<div class="match" id="filtMatchSlider" data-amount-min="65"  data-amount-max="100" >
									<div class="ui-slider-handle"></div>
									<div class="range_amount"></div>
								</div>
							</div>
						</div>
					</li>
					<li class="style">
						<!-- <div class="ht">STYLE</div> -->
						<div class="ct">
							<ul class="list">
								<li>
									<label><input type="checkbox"><span class="tit">Casual</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Girly</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Tomboy</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Business</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Chic</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Bohemian</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Sexy</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Punk</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Sporty</span></label>
								</li>
							</ul>
						</div>
					</li>
					<!-- <li class="keyword">
						<div class="ct">
							<input type="search" class="input key" placeholder="검색어 입력">
						</div>
					</li>
					<li class="gender">
						<div class="ht">성별</div>
						<div class="ct">
							<label class="radio"><input type="radio" name="filter_gender"><span>여자</span></label>
							<label class="radio"><input type="radio" name="filter_gender"><span>남자</span></label>
						</div>
					</li>
					<li class="country">
						<div class="ht">국가</div>
						<div class="ct">
							<select class="select">
								<option>Korea</option>
								<option>Korea</option>
							</select>
						</div>
					</li> -->
				</ul>
			</main>
		</div>
		<div class="pbt">
			<div class="in">
				<div class="bts">
					<a class="btn xl d btnSave" href="javascript:;" onclick="ui.popLayer.close('popFilter');">SAVE</a>
				</div>
			</div>
		</div>
	</div>
</article>
<script>
var popFilter = function(){
	ui.popLayer.open('popFilter',{
		ocb: function(){
			ui.filter.init();	
		}
	});
	
};
</script>

<!-- 사이즈 -->
<article class="popLayer a popSize" id="popSize">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="phd">
			<div class="hdt">
				<h1 class="title">MY SIZE</h1>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<ul class="filters">
					<li class="hgt">
						<div class="ht">HEIGHT</div>
						<div class="ct">
							<div class="uiSlider hgt">
								<div class="height" id="sizeHeightSlider" data-amount="168">
									<em class="bar"></em>
									<div class="ui-slider-handle"></div>
									<div class="range_amount"></div>
									<div class="nums">
										<span class="num min">1M</span>
										<span class="num max">2M<i></i></span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="age">
						<div class="ht">AGE</div>
						<div class="ct">
							<select class="select">
								<c:forEach begin="15" end="60" var="i">
									<option><c:out value="${i}"/></option>
								</c:forEach>
							</select>
						</div>
					</li>
					<li class="fit">
						<div class="ht">Fit</div>
						<div class="ct">
							<div class="uiSlider fit">
								<div class="fit" id="sizeFittSlider" data-amount="50">
									<em class="bar"></em>
									<div class="ui-slider-handle"></div>
									<!-- <div class="range_amount"></div> -->
									<div class="nums">
										<span class="num min">Tight</span>
										<span class="num mid">FIT</span>
										<span class="num max">Oversized<i></i></span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="bra">
						<div class="ht">BRA</div>
						<div class="ct">
							<div class="slideSize cup swiper-container">
								<ul class="list cup swiper-wrapper slide">
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">A</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">B</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">C</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">D</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">E</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">F</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">G</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">H</span></label></li>
								</ul>
							</div>
							<div class="slideSize siz swiper-container">
								<ul class="list siz swiper-wrapper slide">
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">60</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">65</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">70</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">75</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">80</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">85</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">90</span></label></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="bot">
						<div class="ht">BOTTOM</div>
						<div class="ct">
							<div class="slideSize bot swiper-container">
								<ul class="list bot swiper-wrapper slide">

									<c:forEach begin="20" end="39" var="i">
										<li class="swiper-slide">
											<label><input type="radio" name="size_bott">
												<span class="tit"><c:out value="${i}"/></span>
											</label>
										</li>
									</c:forEach>									
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</main>
		</div>
		<div class="pbt">
			<div class="in">
				<div class="bts">
					<a class="btn xl d btnSave" href="javascript:;" onclick="ui.popLayer.close('popSize');">SAVE</a>
				</div>
			</div>
		</div>
	</div>
</article>
<script>
var popSize = function(){
	ui.popLayer.open('popSize',{
		ocb: function(){
			ui.size.init();
		}
	});
	
};
</script>

<!-- 검색 -->
<article class="popLayer a popSearch" id="popSearch">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="phd">
			<div class="hdt">
				<h1 class="title">SEARCH</h1>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				
				<div class="sec formSch">
					<div class="sch">
						<input type="search" class="input key" id="input_kwd" placeholder="#@" value="">
						<a href="javascript:;" class="bt sch">SEARCH</a>			
						<a href="javascript:;" class="bt cancel" id="btSchCancel">CANCEL</a>					
					</div>
				</div>

				<div class="tags">
					<ul class="tg">
						<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#유니크스타일</em> </a></li>
						<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#톰보이스타일</em> </a></li>
						<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#호피무늬</em> </a></li>
					</ul>
				</div>

				<div class="recent">
					<div class="ht">RECENT</div>
					<ul class="list">
						<li>
							<div class="box">
								<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li>
							<div class="box">
								<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li>
							<div class="box">
								<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li>
							<div class="box">
								<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li class="nodata">
							<div class="msg">검색기록이 존재하지 않습니다.</div>
						</li>
					</ul>
				</div>
				
			</main>
		</div>
	</div>
</article>
<script>
var popSearch = function(){
	ui.popLayer.open('popSearch',{
		ocb: function(){
			ui.filter.match();	
		}
	});
	
};
$(document).ready(function(){
	// popSearch();

	// $(document).on("keyup","#input_kwd",function (e) {
	// 	if( e.keyCode == 13 ) {
	// 		window.location.href = '../common/searchResult.jsp';
	// 	}
	// });
	// $(document).on("click","#btSchCancel",function (e) {

	// 	$("#input_kwd").val("")

	// });



});
</script>


<!--  추가 메뉴 popOthers -->
<article class="popLayer c popOthers" id="popOthers">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:;" class="bt">EDIT</a></li>
					<li class="st"><a href="javascript:;" class="bt">DELETE</a></li>
					<li><a href="javascript:;" class="bt" onclick="testUrlCopy(); ui.popLayer.close('popOthers');">COPY LINK</a></li>
					<li><a href="javascript:;" class="bt" onclick="testUrlCopy(); ui.popLayer.close('popOthers');">COPY PROFILE LINK</a></li>
					<li><a href="javascript:;" class="bt" onclick="popShare(); ui.popLayer.close('popOthers');">SHARE</a></li>
					<li class="st"><a href="javascript:;" class="bt" onclick="popAccus(); ui.popLayer.close('popOthers');">REPORT</a></li>
				</ul>
			</main>
		</div>
	</div>
</article>

<!-- 신고 하기  -->
<article class="popLayer c popAccus" id="popAccus">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li class="st"><a href="javascript:postReport(1);" onclick="ui.toast({msg:'<p>Thanks for letting us know.</p>'}); ui.popLayer.close('popAccus');" class="bt">It’s Spam</a></li>
					<li class="st"><a href="javascript:postReport(2);" onclick="ui.toast({msg:'<p>Thanks for letting us know.</p>'}); ui.popLayer.close('popAccus');" class="bt">It’s appropriate</a></li>
				</ul>
			</main>
		</div>
	</div>
</article>
<script>
var postReport = function(status) {
	var postUrl = "/app/home/report.do";

	fp.util.jsonAjax({
		url:postUrl,
		data : {
			idKey : fp.data.targetIdKey,
			detail : status,
			type : fp.data.reportType,
			userIdKey : '${sessionScope.__sessiondata__.idKey}'
		},
		success:function() {
			/* alert("success"); */
		},
		error:function() {
			/* alert("error"); */
		}
	});
}

function popAccus(){
	ui.popLayer.open('popAccus',{
		zIndex : 1500,
		ocb:function(){
			console.log("신고하기팝업 열림");
			// ui.popLayer.close('popPrfOthers');
		},
		ccb:function(){
			console.log("신고하기팝업 닫힘");
		}
	});
};
</script>




<!-- 매칭율 -->
<article class="popLayer c popMatching" id="popMatching">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">FAPEE 매칭율</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				
				<p>내용</p>
				<p>내용</p>
				<div class="uiSlider">
					<div class="mat" id="popMatchSlider" data-amount="85">
						<em class="bar"></em>
						<div class="ui-slider-handle"><span class="match-handle"></span></div>
						<div class="nums">
							<span class="num min">0</span>
							<span class="ds">~</span>
							<span class="num max">100<i>%</i></span>
						</div>
					</div>
				</div>
				<p>내용</p>
				<div class="botBts">
					<div class="btnSet">
					<a href="javascript:;" class="btn type a btnFind" onclick="ui.popLayer.close('popMatching')">다시찾기</a></div>
				</div>		
				
			</main>
		</div>
	</div>
</article>

<script>
var popMatching={
	using:function(){
		ui.popLayer.open('popMatching',{
			ocb:function(){
				popMatching.slider();
				console.log("매칭 열림");
			},
			ccb:function(){
				console.log("매칭 닫힘");
			}
		});
	},
	slider:function(){
		var $slider = $("#popMatchSlider");
		var bar = $slider.find("em.bar");
		var handle = $slider.find(".match-handle");
		$slider.slider({
			value: $slider.attr("data-amount") ,
			min: 0,
			max: 100,
			step: 1,
			create: function(event, ui) {
				handle.text( $(this).slider( "value" ) + "%");
				bar.css("width", $(this).slider( "value" ) + "%");
			}
		});

		$slider.on("slidechange slide", function( event, ui ) {
			handle.text( ui.value + "%");
			bar.css("width", $(this).slider( "value" ) + "%");
			$(this).attr("data-amount",ui.value);
			$("#match_amount").text(  ui.value + "%"  );
			// console.log(ui.value);
		} );
		// console.log("매칭 오픈");
	}
};
$(document).ready(function(){
	popMatching.slider();
});
</script>





<!-- 선호스타일 -->
<article class="popLayer c popMyStyle" id="popMyStyle">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">선호스타일</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				
				<div class="uiChk"><input type="checkbox" checked="checked"><em></em></div>
				<p>내용</p>
				<div class="botBts">
					<div class="btnSet">
					<a href="javascript:;" class="btn type a btnFind" onclick="ui.popLayer.close('popMyStyle')">확인</a></div>
				</div>	
			</main>
		</div>
	</div>
</article>
<script>
function popMyStyle(){
	ui.popLayer.open('popMyStyle',{
		ocb:function(){
			console.log("선호스타일 열림");
		},
		ccb:function(){
			console.log("선호스타일 닫힘");
		}
	});
};
</script>





<!-- 프로필 기타 팝업 -->
<article class="popLayer c popPrfOthers" id="popPrfOthers">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:;" class="bt" onclick="testUrlCopy(); ui.popLayer.close('popPrfOthers');">COPY PROFILE LINK</a></li>
					<li><a href="javascript:;" onclick="popShare(); ui.popLayer.close('popPrfOthers');" class="bt">SHARE</a></li>
					<c:if test="${!isMyProfile}">
						<li class="st"><a href="javascript:;" class="bt" onclick="popAccus(); ui.popLayer.close('popPrfOthers');">REPORT</a></li>
					</c:if>
				</ul>	
			</main>
		</div>
	</div>
</article>
<script>
function popPrfOthers(){
	ui.popLayer.open('popPrfOthers',{
		ocb:function(){
			console.log("프로필 기타팝업 열림");
		},
		ccb:function(){
			console.log("11");
		}
	});
};
</script>






<!-- 공유하기 팝업 -->
<article class="popLayer c popShare" id="popShare">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li class="twitter"><a href="javascript:;" class="bt">TWITTER</a></li>
					<li class="katalk"><a href="javascript:;" class="bt">KAKAOTALK</a></li>
					<li class="facebook"><a href="javascript:;" class="bt">FACEBOOK</a></li>
					<li class="kastory"><a href="javascript:;" class="bt">KAKAOSTORY</a></li>
				</ul>	
			</main>
		</div>
	</div>
</article>
<script>
function popShare(){
	// ui.popLayer.open('popShare',{
	// 	ocb:function(){
	// 		// ui.popLayer.close('popPrfOthers');
	// 		console.log("공유하기 열림");
	// 	},
	// 	ccb:function(){
	// 		console.log("공유하기 닫힘");
	// 	}
	// });
};
</script>



<script>
function testUrlCopy() {
	// 클립보드로 복사하는 기능을 생성
	var aux = document.createElement("input"); // 글을 쓸 수 있는 란을 만든다.
	aux.setAttribute("value", window.location.href); // 지정된 요소의 값을 할당 한다.
	document.body.appendChild(aux); // bdy에 추가한다.
	aux.select(); // 지정된 내용을 강조한다.
	document.execCommand("copy"); // 텍스트를 카피 하는 변수를 생성
	document.body.removeChild(aux); // body 로 부터 다시 반환 한다.
	console.log(aux.value);

	ui.toast({msg:'<p>Link copied to clipboard</p>'});
}
</script>




<!-- 프로필사진변경 -->
<article class="popLayer c popPrfPicMod" id="popPrfPicMod">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:openPhotoMulti()" class="bt">CHANGE PHOTO</a></li>
					<li><a href="javascript:;" class="bt">DELETE PHOTO</a></li>
				</ul>
			</main>
		</div>
	</div>
</article>
<script>
function popPrfPicMod(){
	ui.popLayer.open('popPrfPicMod',{
		ocb:function(){
			console.log("프로필사진변경 열림");
		},
		ccb:function(){
			console.log("프로필사진변경 닫힘");
		}
	});
};
</script>
	</div>
	
	<script>
        var nationNumFnc = function(){

            $(document).on("change","#nation_code",function(e){
                var ncode = $("#nation_code").val() + " ";
                $("#my_phone_number").val( ncode ).focus();
            });
        };

        nationNumFnc();
        $(function() {
			var timer = fp.util.getTimer(180,'.certi .time');
			
			window.onpopstate = function () {
				timer.destroy();
			};
			
			$('.phone a').click(function() {
				
				$(".phone input, .certi input").removeClass("no");
				
				$('.msgcode').hide();
				$('.findpws').hide();
				$('#msg_exist').removeClass('show');

				var $nation = $('#nation_code').val();

				var $phone = $('.phone input').val();

				if($phone.startsWith('0')){
				    $phone = $phone.substring(1, $phone.length);
				}

				$phone = $nation + $phone;

				/*
				if(!fp.util.checkRegEx('mobile',$phone)) {
					$(".phone input").addClass("no");
					timer.destroy();
					$('#msg_exist').addClass('show');
					$('#msg_exist').text('올바른 전화번호를 입력해주세요.');
					$('.phone input').focus();
					
					return false;
				}
				*/
				$.ajax({
					type : 'post',
					url : '/app/user/join_mobileCertified.do',
					data : {
						'mobile' : $phone
					},
					success: function(data) {
						//alert(data);
						var res = data.split(":");
						// alert(res[0]);
						
						// 테스트를 위해 전화번호 중복가입 가능하게 함
						if(res[0] === 'send') {
							fp.data.join = {
								deviceId : 'emsdf1-saesd-vsdaf-esdfs',
								mobile : $phone
							};
							
							$('.msgcode').show();
							timer.start();
							alert(res[1]);
						}else if(res[0] === 'exist'){
							$(".phone input").addClass("no");
							$('#msg_exist').addClass('show');
							$('#msg_exist').text('이미 가입된 전화번호입니다.')
							$('.findpws').show();
							timer.destroy();
						}
					}
				});
				
				return false;
			});
			
			$('.agree input[type=checkbox]').change(function() {
				if($('.agree input[type=checkbox]').is(':checked')) {
					$('#msg_agree').removeClass('show');
					return false;
				}
			});
			
			$('.fit a').click(function() {
				
				$(".certi input").removeClass("no");
				var $verification = $('.certi input').val();
				
				if($('.agree input[type=checkbox]').is(':checked') === false) {
					$('#msg_exist').removeClass('show');
					$('#msg_agree').addClass('show');
					return false;
				}
				
				if(timer.isStart() === false) {
					$('#msg_exist').addClass('show');
					$('#msg_exist').text('인증코드를 보내주세요.');
					$('.findpws').hide();
					$('.phone input').focus();
					return false;
				}
				
				if(timer.isEnd() === true) {
					$('.msgcode').hide();
					$('#msg_exist').addClass('show');
					$('#msg_exist').text('인증코드를 다시 보내주세요.');
					return false;
				}
				
				if($verification.length === 0) {
					$(".certi input").addClass("no");
					$('.msgcode').hide();
					$('#msg_exist').addClass('show');
					$('#msg_exist').text('인증코드를 입력해 주세요.');
					 $('.certi input').focus();
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/user/join_mobileCertified2.do',
					data : {
						'verification' : $verification
					},
					success: function(data) {
						if(data === 't') {
							$(".phone input, .certi input").removeClass("no");
							timer.destroy();
							timer = null;
							pjax('./join_id.do');
						} else if (data === 'f') {
							$(".certi input").addClass("no");
							$('.msgcode').hide();
							$('#msg_exist').addClass('show');
							$('#msg_exist').text('인증 코드를 다시 확인하세요.');
						}
						
					}
				});
				
				return false;
			});
			
		});
	</script>
</div>