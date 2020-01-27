<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain findPw">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="findForm">
				<div class="hdt"><em>비밀번호 찾기</em></div>
				<div class="msg">가입 시 인증한 전화 번호를 입력하시면 <br> 본인 확인 코드를 보내드립니다. </div>

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

</div>
				<div class="botFixed">
					<div class="in">
						<div class="btnSet fit">
							<a href="javascript:;" class="btn xl b fill">NEXT</a>
						</div>
					</div>
			</div>
		</main>
	</div>

	
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>
	
	
	<script>
		$(function() {
			
			var timer2 = fp.util.getTimer(180,'.certi .time');
			
			window.onpopstate = function () {
				timer2.destroy();
			};
			
			$('.phone a').click(function() {
				
				$(".phone input, .certi input").removeClass("no");
				
				$('.msgcode').hide();
				$('#msg_check').removeClass('show');

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


                if(!fp.util.checkRegEx('mobile',$phone)) {
					$(".phone input").addClass("no");
					timer2.destroy();
					$('#msg_check').addClass('show');
					$('#msg_check').text('올바른 전화번호를 입력해주세요.');
					$('.phone input').focus();
					
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/user/find_password.do',
					data : {
						'mobile' : $phone
					},
					success: function(data) {
						if(data === 'send') {
							$('.msgcode').show();
							timer2.start();
						} else if(data === 'notExist') {
							$(".phone input").addClass("no");
							$('#msg_check').addClass('show');
							$('#msg_check').text('등록 되지 않은정보입니다.')
							$('.phone input').focus();
							timer2.destroy();
						}
					}
				});
				
				return false;
			});
			
			
			$('.fit a').click(function() {
				
				$(".certi input").removeClass("no");
				var $verification = $('.certi input').val();
				
				if(timer2.isStart() === false) {
					$('#msg_check').addClass('show');
					$('#msg_check').text('인증코드를 보내주세요.');
					$('.phone input').focus();
					return false;
				}
				
				if(timer2.isEnd() === true) {
					$('.msgcode').hide();
					$('#msg_check').addClass('show');
					$('#msg_check').text('인증코드를 다시 보내주세요.');
					return false;
				}
				
				if($verification.length === 0) {
					$(".certi input").addClass("no");
					$('.msgcode').hide();
					$('#msg_check').addClass('show');
					$('#msg_check').text('인증코드를 입력해 주세요.');
					 $('.certi input').focus();
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/user/find_password2.do',
					data : {
						'verification' : $verification
					},
					success: function(data) {
						if(data === 't') {
							$(".phone input, .certi input").removeClass("no");
							timer2.destroy();
							timer2 = null;
							pjax('./find_passwordReset.do');
						} else if (data === 'f') {
							$(".certi input").addClass("no");
							$('.msgcode').hide();
							$('#msg_check').addClass('show');
							$('#msg_check').text('인증 코드를 다시 확인하세요.');
						}
						
					}
				});
				
				return false;
			});
			
		});
	</script>
</div>